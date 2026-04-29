import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/quiz/data/datasources/quiz_local_datasource.dart';
import 'features/quiz/data/models/quiz_result_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuizResultModelAdapter());
  await Hive.openBox<QuizResultModel>(kQuizResultBoxName);

  // ProviderScope bắt buộc khi dùng Riverpod — lưu trữ tất cả provider instances.
  runApp(const ProviderScope(child: FunFortuneTellingApp()));
}

class FunFortuneTellingApp extends StatelessWidget {
  const FunFortuneTellingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bói Vui Mỗi Ngày',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}
