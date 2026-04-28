import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasources/quiz_local_datasource.dart';
import '../data/repositories/quiz_repository_impl.dart';
import '../domain/entities/quiz_entity.dart';
import '../domain/entities/quiz_result_entity.dart';
import '../domain/repositories/quiz_repository.dart';
import '../domain/usecases/get_all_quizzes_usecase.dart';
import '../domain/usecases/get_quiz_by_id_usecase.dart';
import '../domain/usecases/get_quiz_history_usecase.dart';
import '../domain/usecases/save_quiz_result_usecase.dart';

// ═══════════════════════════════════════════════════════════
// TẦNG DATA — Providers cho DataSource & Repository
// ═══════════════════════════════════════════════════════════

/// Provider cho Local DataSource (Hive).
///
/// [Provider] là loại provider cơ bản nhất — trả về một object bất biến,
/// không theo dõi state. Dùng cho dependency injection thuần tuý.
final quizLocalDataSourceProvider = Provider<QuizLocalDataSource>((ref) {
  return QuizLocalDataSourceImpl();
});

/// Provider cho Repository.
///
/// Repository phụ thuộc vào DataSource → dùng [ref.watch] để lấy DataSource.
/// Nhờ đó, nếu DataSource thay đổi (ví dụ: đổi implementation),
/// Repository cũng tự động cập nhật.
final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final localDataSource = ref.watch(quizLocalDataSourceProvider);
  return QuizRepositoryImpl(localDataSource: localDataSource);
});

// ═══════════════════════════════════════════════════════════
// TẦNG DOMAIN — Providers cho Use Cases
// ═══════════════════════════════════════════════════════════

final getAllQuizzesUseCaseProvider = Provider<GetAllQuizzesUseCase>((ref) {
  return GetAllQuizzesUseCase(ref.watch(quizRepositoryProvider));
});

final getQuizByIdUseCaseProvider = Provider<GetQuizByIdUseCase>((ref) {
  return GetQuizByIdUseCase(ref.watch(quizRepositoryProvider));
});

final saveQuizResultUseCaseProvider = Provider<SaveQuizResultUseCase>((ref) {
  return SaveQuizResultUseCase(ref.watch(quizRepositoryProvider));
});

final getQuizHistoryUseCaseProvider = Provider<GetQuizHistoryUseCase>((ref) {
  return GetQuizHistoryUseCase(ref.watch(quizRepositoryProvider));
});

// ═══════════════════════════════════════════════════════════
// TẦNG PRESENTATION — Providers cho UI state
// ═══════════════════════════════════════════════════════════

/// [FutureProvider] tự động xử lý async: loading → data → error.
/// UI chỉ cần .when(data:, loading:, error:) để handle từng trạng thái.
///
/// Dùng khi: fetch dữ liệu một lần, không cần user tương tác thay đổi state.
final allQuizzesProvider = FutureProvider<List<QuizEntity>>((ref) async {
  final useCase = ref.watch(getAllQuizzesUseCaseProvider);
  return useCase.execute();
});

/// FutureProvider.family: tạo provider có tham số.
/// Dùng khi cần fetch theo ID — mỗi ID tạo một provider instance riêng.
final quizByIdProvider =
    FutureProvider.family<QuizEntity, String>((ref, id) async {
  final useCase = ref.watch(getQuizByIdUseCaseProvider);
  return useCase.execute(id);
});

/// FutureProvider cho lịch sử — refresh được bằng ref.invalidate()
final quizHistoryProvider =
    FutureProvider<List<QuizResultEntity>>((ref) async {
  final useCase = ref.watch(getQuizHistoryUseCaseProvider);
  return useCase.execute();
});

// ═══════════════════════════════════════════════════════════
// STATE PROVIDER — Theo dõi câu trả lời hiện tại trong quiz
// ═══════════════════════════════════════════════════════════

/// [StateProvider] cho phép đọc VÀ ghi state đơn giản từ UI.
///
/// Map<questionId, optionValue> lưu câu trả lời người dùng đã chọn.
/// Ví dụ: {'p_q1': 'social', 'p_q2': 'achiever'}
///
/// Dùng khi: state đơn giản, UI tự cập nhật trực tiếp (không cần logic phức tạp).
final quizAnswersProvider =
    StateProvider<Map<String, String>>((ref) => {});

/// Provider tính điểm: đếm tần suất xuất hiện của mỗi value trong câu trả lời.
/// Đây là pure computed state — tự động recalculate khi [quizAnswersProvider] thay đổi.
final quizScoreProvider = Provider<Map<String, int>>((ref) {
  final answers = ref.watch(quizAnswersProvider);
  final scores = <String, int>{};
  for (final value in answers.values) {
    scores[value] = (scores[value] ?? 0) + 1;
  }
  return scores;
});

/// Provider tính kết quả cuối: lấy value có điểm cao nhất.
final quizResultKeyProvider = Provider<String?>((ref) {
  final scores = ref.watch(quizScoreProvider);
  if (scores.isEmpty) return null;
  return scores.entries
      .reduce((a, b) => a.value >= b.value ? a : b)
      .key;
});
