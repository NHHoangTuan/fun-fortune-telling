import '../entities/quiz_result_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use Case: Lấy lịch sử các kết quả trắc nghiệm đã làm.
///
/// Use case này trả về danh sách các kết quả mà người dùng đã hoàn thành,
/// dùng để hiển thị trên màn hình "Lịch sử" hoặc "Hồ sơ".
///
/// Có thể mở rộng thêm logic:
/// - Phân trang (pagination) khi lịch sử quá dài
/// - Lọc theo category
/// - Tính thống kê (ví dụ: đã làm bao nhiêu quiz, category nào nhiều nhất)
///
/// ### Cách sử dụng:
/// ```dart
/// final useCase = GetQuizHistoryUseCase(repository);
/// final history = await useCase.execute();
/// ```
class GetQuizHistoryUseCase {
  final QuizRepository _repository;

  GetQuizHistoryUseCase(this._repository);

  /// Thực thi use case: lấy toàn bộ lịch sử kết quả.
  Future<List<QuizResultEntity>> execute() {
    return _repository.getHistory();
  }
}
