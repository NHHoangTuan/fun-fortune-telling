import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/quiz/data/datasources/quiz_local_datasource.dart';
import 'features/quiz/data/models/quiz_result_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Hive — phải gọi trước khi mở bất kỳ Box nào.
  // initFlutter() tự tìm đường dẫn lưu file phù hợp với từng nền tảng.
  await Hive.initFlutter();

  // Đăng ký TypeAdapter cho QuizResultModel.
  // TypeAdapter là "bộ dịch" giúp Hive biết cách đọc/ghi object này.
  // QuizResultModelAdapter được generate tự động bởi hive_generator
  // khi chạy build_runner (từ annotation @HiveType trên QuizResultModel).
  Hive.registerAdapter(QuizResultModelAdapter());

  // Mở Box trước khi app chạy để QuizLocalDataSourceImpl có thể dùng ngay.
  // Box phải được mở trước khi gọi Hive.box() (sync) ở bất kỳ đâu.
  await Hive.openBox<QuizResultModel>(kQuizResultBoxName);

  // ProviderScope bọc toàn bộ app — bắt buộc khi dùng Riverpod.
  // Đây là nơi Riverpod lưu trữ tất cả provider instances.
  runApp(const ProviderScope(child: FunFortuneTellingApp()));
}

class FunFortuneTellingApp extends StatelessWidget {
  const FunFortuneTellingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bói Vui Mỗi Ngày 🔮',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C3FC5),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            '🔮 Fun Fortune Telling\nData Layer Ready!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
