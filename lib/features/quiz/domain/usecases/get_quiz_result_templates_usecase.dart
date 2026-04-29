import '../entities/quiz_result_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use Case: Lấy danh sách kết quả có thể nhận được của một quiz.
class GetQuizResultTemplatesUseCase {
  final QuizRepository _repository;

  GetQuizResultTemplatesUseCase(this._repository);

  Future<List<QuizResultEntity>> execute(String quizId) {
    return _repository.getResultTemplates(quizId);
  }
}
