import '../entities/quiz_entity.dart';
import '../entities/quiz_result_entity.dart';

/// Interface (abstract class) định nghĩa "hợp đồng" giữa Domain Layer và Data Layer.
///
/// Domain Layer chỉ biết đến interface này, KHÔNG biết dữ liệu lấy từ đâu
/// (API, local database, file JSON, hay hardcode).
///
/// Data Layer sẽ implement interface này (ví dụ: QuizRepositoryImpl)
/// để cung cấp dữ liệu thực tế.
///
/// → Đây chính là Dependency Inversion Principle (chữ D trong SOLID):
///   "High-level modules should not depend on low-level modules.
///    Both should depend on abstractions."
abstract class QuizRepository {
  /// Lấy danh sách tất cả bài trắc nghiệm.
  ///
  /// Trả về [List<QuizEntity>] chứa thông tin tổng quan của các bài quiz.
  /// Data Layer quyết định lấy từ API hay local storage.
  Future<List<QuizEntity>> getAllQuizzes();

  /// Lấy chi tiết một bài trắc nghiệm theo [id].
  ///
  /// Trả về [QuizEntity] nếu tìm thấy, hoặc throw exception nếu không tồn tại.
  Future<QuizEntity> getQuizById(String id);

  /// Lưu kết quả bài trắc nghiệm sau khi người dùng hoàn thành.
  ///
  /// [result] chứa thông tin kết quả cần lưu (quizId, resultKey, title, ...).
  /// Data Layer quyết định lưu vào Hive, SharedPreferences, hay server.
  Future<void> saveResult(QuizResultEntity result);

  /// Lấy lịch sử các kết quả trắc nghiệm đã làm.
  ///
  /// Trả về [List<QuizResultEntity>] sắp xếp theo thời gian (mới nhất trước).
  Future<List<QuizResultEntity>> getHistory();
}
