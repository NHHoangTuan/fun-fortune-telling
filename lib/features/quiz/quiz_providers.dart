import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/datasources/quiz_local_datasource.dart';
import 'data/repositories/quiz_repository_impl.dart';
import 'domain/entities/quiz_entity.dart';
import 'domain/entities/quiz_result_entity.dart';
import 'domain/repositories/quiz_repository.dart';
import 'domain/usecases/delete_quiz_result_usecase.dart';
import 'domain/usecases/get_all_quizzes_usecase.dart';
import 'domain/usecases/get_quiz_by_id_usecase.dart';
import 'domain/usecases/get_quiz_history_usecase.dart';
import 'domain/usecases/get_quiz_result_templates_usecase.dart';
import 'domain/usecases/save_quiz_result_usecase.dart';
import 'presentation/state/quiz_play_notifier.dart';

// ─── Data Layer ───────────────────────────────────────────

final quizLocalDataSourceProvider = Provider<QuizLocalDataSource>((ref) {
  return QuizLocalDataSourceImpl();
});

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  return QuizRepositoryImpl(
    localDataSource: ref.watch(quizLocalDataSourceProvider),
  );
});

// ─── Domain Layer (Use Cases) ─────────────────────────────

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

final deleteQuizResultUseCaseProvider =
    Provider<DeleteQuizResultUseCase>((ref) {
  return DeleteQuizResultUseCase(ref.watch(quizRepositoryProvider));
});

final getQuizResultTemplatesUseCaseProvider =
    Provider<GetQuizResultTemplatesUseCase>((ref) {
  return GetQuizResultTemplatesUseCase(ref.watch(quizRepositoryProvider));
});

// ─── Presentation Layer ───────────────────────────────────

/// FutureProvider tự xử lý async loading/error/data — UI dùng .when() để handle.
final allQuizzesProvider = FutureProvider<List<QuizEntity>>((ref) {
  return ref.watch(getAllQuizzesUseCaseProvider).execute();
});

/// family: tạo provider có tham số — mỗi id tạo 1 instance riêng.
final quizByIdProvider = FutureProvider.family<QuizEntity, String>((ref, id) {
  return ref.watch(getQuizByIdUseCaseProvider).execute(id);
});

final quizHistoryProvider = FutureProvider<List<QuizResultEntity>>((ref) {
  return ref.watch(getQuizHistoryUseCaseProvider).execute();
});

final quizResultTemplatesProvider =
    FutureProvider.family<List<QuizResultEntity>, String>((ref, id) {
  return ref.watch(getQuizResultTemplatesUseCaseProvider).execute(id);
});

final quizPlayProvider =
    NotifierProvider<QuizPlayNotifier, QuizPlayState>(QuizPlayNotifier.new);

/// StateProvider: state đơn giản mà UI đọc/ghi trực tiếp.
/// Lưu Map&lt;questionId, optionValue&gt; — câu trả lời người dùng đã chọn.
final quizAnswersProvider = StateProvider<Map<String, String>>((ref) => {});

/// Computed provider: tính điểm từ answers, tự recalculate khi answers thay đổi.
final quizScoreProvider = Provider<Map<String, int>>((ref) {
  final answers = ref.watch(quizAnswersProvider);
  final scores = <String, int>{};
  for (final value in answers.values) {
    scores[value] = (scores[value] ?? 0) + 1;
  }
  return scores;
});

/// Kết quả cuối: value có điểm cao nhất.
final quizResultKeyProvider = Provider<String?>((ref) {
  final scores = ref.watch(quizScoreProvider);
  if (scores.isEmpty) return null;
  return scores.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
});
