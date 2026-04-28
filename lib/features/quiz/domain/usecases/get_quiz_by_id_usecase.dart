import '../entities/quiz_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use Case: Lấy chi tiết một bài trắc nghiệm theo ID.
///
/// Use case này có thể mở rộng thêm logic như:
/// - Kiểm tra quiz có bị khoá không (premium quiz)
/// - Đánh dấu quiz đã được xem
/// - Tải thêm dữ liệu liên quan (ví dụ: số người đã làm)
///
/// ### Cách sử dụng:
/// ```dart
/// final useCase = GetQuizByIdUseCase(repository);
/// final quiz = await useCase.execute('quiz_mbti_01');
/// ```
class GetQuizByIdUseCase {
  final QuizRepository _repository;

  GetQuizByIdUseCase(this._repository);

  /// Thực thi use case: lấy quiz theo [id].
  ///
  /// Throw exception nếu không tìm thấy quiz với [id] tương ứng.
  Future<QuizEntity> execute(String id) {
    return _repository.getQuizById(id);
  }
}
