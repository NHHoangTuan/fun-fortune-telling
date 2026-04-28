import '../entities/quiz_result_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use Case: Lưu kết quả bài trắc nghiệm.
///
/// Sau khi người dùng hoàn thành quiz và hệ thống tính ra kết quả,
/// use case này chịu trách nhiệm lưu trữ kết quả đó.
///
/// Có thể mở rộng thêm logic:
/// - Validate kết quả trước khi lưu
/// - Gửi analytics event
/// - Kiểm tra và cập nhật thành tích (achievements)
///
/// ### Cách sử dụng:
/// ```dart
/// final useCase = SaveQuizResultUseCase(repository);
/// await useCase.execute(quizResult);
/// ```
class SaveQuizResultUseCase {
  final QuizRepository _repository;

  SaveQuizResultUseCase(this._repository);

  /// Thực thi use case: lưu [result] vào storage.
  Future<void> execute(QuizResultEntity result) {
    return _repository.saveResult(result);
  }
}
