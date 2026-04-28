import '../../domain/entities/quiz_entity.dart';
import '../../domain/entities/quiz_result_entity.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_local_datasource.dart';
import '../datasources/quiz_static_data.dart';
import '../models/option_model.dart';
import '../models/question_model.dart';
import '../models/quiz_model.dart';
import '../models/quiz_result_model.dart';

/// Implement cụ thể của [QuizRepository] từ Domain Layer.
///
/// ### Dependency Inversion Principle (DIP) trong thực tế:
///
/// Domain Layer định nghĩa "hợp đồng":
///   abstract class QuizRepository { ... }
///
/// Data Layer thực thi hợp đồng đó:
///   class QuizRepositoryImpl IMPLEMENTS QuizRepository
///
/// Kết quả:
/// - Domain Layer KHÔNG biết QuizRepositoryImpl tồn tại
/// - Data Layer PHỤ THUỘC vào Domain (không phải ngược lại)
/// - Muốn đổi nguồn dữ liệu từ JSON cứng → API thật? Chỉ cần tạo
///   QuizRepositoryApiImpl implements QuizRepository — Domain không đổi một chữ!
class QuizRepositoryImpl implements QuizRepository {
  final QuizLocalDataSource _localDataSource;

  QuizRepositoryImpl({required QuizLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<List<QuizEntity>> getAllQuizzes() async {
    // Parse dữ liệu JSON tĩnh → Model → Entity
    return kStaticQuizzes.map(_parseQuizMap).toList();
  }

  @override
  Future<QuizEntity> getQuizById(String id) async {
    final quizMap = kStaticQuizzes.firstWhere(
      (q) => q['id'] == id,
      orElse: () => throw Exception('Quiz không tìm thấy: $id'),
    );
    return _parseQuizMap(quizMap);
  }

  @override
  Future<void> saveResult(QuizResultEntity result) async {
    final model = QuizResultModel.fromEntity(result);
    await _localDataSource.saveResult(model);
  }

  @override
  Future<List<QuizResultEntity>> getHistory() async {
    final models = await _localDataSource.getHistory();
    return models.map((m) => m.toEntity()).toList();
  }

  // ─── Private helper ───

  /// Parse từ Map<String, dynamic> (JSON) → QuizEntity.
  /// Logic parse nằm ở đây trong Repository, không rò rỉ ra Use Case hay UI.
  QuizEntity _parseQuizMap(Map<String, dynamic> map) {
    final questionMaps = map['questions'] as List<dynamic>;
    final questions = questionMaps.map((qMap) {
      final optionMaps = qMap['options'] as List<dynamic>;
      final options = optionMaps
          .map((o) => OptionModel.fromJson(Map<String, dynamic>.from(o as Map)))
          .toList();
      return QuestionModel.fromJson({
        ...Map<String, dynamic>.from(qMap as Map),
        'options': options.map((o) => o.toJson()).toList(),
      });
    }).toList();

    final quizModel = QuizModel.fromJson({
      ...Map<String, dynamic>.from(map),
      'questions': questions.map((q) => q.toJson()).toList(),
    });

    return quizModel.toEntity();
  }
}
