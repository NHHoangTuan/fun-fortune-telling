import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/quiz/presentation/screens/home_screen.dart';
import '../../features/quiz/presentation/screens/splash_screen.dart';

/// GoRouter ẩn boilerplate của Navigator 2.0, cho phép định nghĩa route theo URL.
/// Hỗ trợ deep link, redirect, và nested routes gọn hơn nhiều.
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (_, __) => const HomeScreen(),
      routes: [
        GoRoute(
          /// pathParameters: truyền dữ liệu qua URL string.
          /// Dùng: context.push('/home/quiz/quiz_personality_01')
          /// Nhận: state.pathParameters['id']
          path: 'quiz/:id',
          name: 'quiz-detail',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(body: Center(child: Text('Quiz Detail: $id')));
          },
          routes: [
            GoRoute(
              path: 'play',
              name: 'quiz-play',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return Scaffold(body: Center(child: Text('Play: $id')));
              },
            ),
          ],
        ),
        GoRoute(
          /// extra: truyền object phức tạp qua RAM (không persist khi F5 web).
          /// Dùng: context.push('/home/result', extra: quizResultEntity)
          /// Nhận: state.extra as QuizResultEntity
          path: 'result',
          name: 'quiz-result',
          builder: (_, __) =>
              const Scaffold(body: Center(child: Text('Result'))),
        ),
        GoRoute(
          path: 'history',
          name: 'history',
          builder: (_, __) =>
              const Scaffold(body: Center(child: Text('History'))),
        ),
      ],
    ),
  ],
);
