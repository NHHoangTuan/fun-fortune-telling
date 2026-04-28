import 'package:hive_flutter/hive_flutter.dart';

import '../models/quiz_result_model.dart';

/// Tên Box Hive — dùng constant để tránh typo ở nhiều nơi.
const String kQuizResultBoxName = 'quiz_results';

/// Local Data Source: đọc/ghi lịch sử kết quả từ Hive.
///
/// ### Hive là gì?
/// Hive là NoSQL key-value database chạy trực tiếp trên thiết bị (local).
/// Nó lưu dữ liệu dưới dạng binary (nhị phân) — nhanh hơn nhiều so với
/// SharedPreferences (chỉ lưu String) và SQLite (phức tạp hơn).
///
/// ### Các khái niệm:
///
/// **Box**: "Thùng chứa" dữ liệu, tương tự như một bảng trong SQL.
/// Một Box lưu nhiều object cùng kiểu. Mở bằng [Hive.openBox<T>()].
///
/// **TypeAdapter**: Hive không tự biết cách lưu custom object của Dart.
/// TypeAdapter là "bộ dịch" giúp Hive chuyển object sang binary và ngược lại.
/// Freezed + hive_generator sẽ tự generate TypeAdapter từ annotation @HiveType.
///
/// **HiveObject**: Nếu muốn object có thêm tính năng (như biết key của chính nó),
/// extend HiveObject. Trong project này, [QuizResultModel] là Freezed class
/// nên KHÔNG extend HiveObject (không tương thích), thay vào đó ta dùng
/// `box.add()` và `box.values` trực tiếp.
abstract class QuizLocalDataSource {
  /// Lưu kết quả vào Hive Box.
  Future<void> saveResult(QuizResultModel model);

  /// Lấy toàn bộ lịch sử kết quả, sắp xếp theo thời gian mới nhất.
  Future<List<QuizResultModel>> getHistory();
}

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  /// Lấy Box đã được mở từ trước (phải gọi Hive.openBox ở main.dart trước).
  /// Không mở Box ở đây để tránh async trong constructor.
  Box<QuizResultModel> get _box => Hive.box<QuizResultModel>(kQuizResultBoxName);

  @override
  Future<void> saveResult(QuizResultModel model) async {
    // box.add() tự động gán key tăng dần (0, 1, 2, ...)
    await _box.add(model);
  }

  @override
  Future<List<QuizResultModel>> getHistory() async {
    // box.values trả về tất cả object trong Box
    final results = _box.values.toList();
    // Sắp xếp mới nhất lên đầu
    results.sort((a, b) => b.savedAt.compareTo(a.savedAt));
    return results;
  }
}
