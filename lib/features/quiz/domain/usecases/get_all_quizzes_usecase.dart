import '../entities/quiz_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use Case: Lấy danh sách tất cả bài trắc nghiệm.
///
/// Đây là use case đơn giản nhất - chỉ delegate xuống repository.
/// Tuy nhiên, khi business logic phức tạp hơn (ví dụ: lọc quiz theo level,
/// sắp xếp theo độ phổ biến), logic đó sẽ được thêm VÀO ĐÂY,
/// chứ KHÔNG phải ở Repository hay ở UI.
///
/// ### Cách sử dụng:
/// ```dart
/// final useCase = GetAllQuizzesUseCase(repository);
/// final quizzes = await useCase.execute();
/// ```
class GetAllQuizzesUseCase {
  final QuizRepository _repository;

  GetAllQuizzesUseCase(this._repository);

  /// Thực thi use case: lấy toàn bộ danh sách quiz.
  Future<List<QuizEntity>> execute() {
    return _repository.getAllQuizzes();
  }
}
