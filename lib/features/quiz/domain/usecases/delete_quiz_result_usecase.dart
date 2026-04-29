import '../entities/quiz_result_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use Case: Xoá một kết quả trắc nghiệm khỏi lịch sử.
class DeleteQuizResultUseCase {
  final QuizRepository _repository;

  DeleteQuizResultUseCase(this._repository);

  Future<void> execute(QuizResultEntity result) {
    return _repository.deleteResult(result);
  }
}
