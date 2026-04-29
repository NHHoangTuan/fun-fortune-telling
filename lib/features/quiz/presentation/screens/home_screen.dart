import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/quiz_category.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../quiz_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ref.watch: lắng nghe + rebuild UI khi provider thay đổi — dùng trong build().
    /// ref.read:  đọc 1 lần không lắng nghe — dùng trong onPressed/callback.
    final quizzesAsync = ref.watch(allQuizzesProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('🔮 ', style: TextStyle(fontSize: 20)),
            Text('Bói Vui Mỗi Ngày'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded, color: AppColors.accent),
            tooltip: 'Lịch sử',
            onPressed: () => context.push('/home/history'),
          ),
        ],
      ),
      body: quizzesAsync.when(
        /// FutureProvider.when() chia 3 nhánh: loading / error / data
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
          ),
        ),
        error: (err, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('😢', style: TextStyle(fontSize: 48)),
              const SizedBox(height: 12),
              Text('$err',
                  style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 16),
              ElevatedButton(
                // ref.invalidate: reset FutureProvider về trạng thái loading → fetch lại
                onPressed: () => ref.invalidate(allQuizzesProvider),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (quizzes) => _QuizGrid(quizzes: quizzes),
      ),
    );
  }
}

// ─── Grid ─────────────────────────────────────────────────

class _QuizGrid extends StatelessWidget {
  final List<QuizEntity> quizzes;
  const _QuizGrid({required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chọn bài trắc nghiệm 🎯',
            style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${quizzes.length} bài đang chờ bạn khám phá',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
              itemCount: quizzes.length,
              itemBuilder: (_, i) => _QuizCard(quiz: quizzes[i]),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Card ─────────────────────────────────────────────────

class _QuizCard extends StatelessWidget {
  final QuizEntity quiz;
  const _QuizCard({required this.quiz});

  @override
  Widget build(BuildContext context) {
    final color = _catColor(quiz.category);
    return GestureDetector(
      onTap: () => context.push('/home/quiz/${quiz.id}'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withValues(alpha: 0.28), AppColors.bgCard],
          ),
          border: Border.all(color: color.withValues(alpha: 0.4)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.15),
              blurRadius: 12, offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color.withValues(alpha: 0.6)),
                ),
                child: Text(
                  _catLabel(quiz.category),
                  style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w700,
                    color: color, letterSpacing: 0.5,
                  ),
                ),
              ),
              const Spacer(),
              Text(_catEmoji(quiz.category),
                  style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 8),
              Text(
                quiz.title,
                style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary, height: 1.3,
                ),
                maxLines: 2, overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                quiz.description,
                style: const TextStyle(
                  fontSize: 11, color: AppColors.textSecondary, height: 1.4,
                ),
                maxLines: 2, overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.quiz_outlined,
                      size: 12, color: AppColors.textMuted),
                  const SizedBox(width: 4),
                  Text(
                    '${quiz.questions.length} câu hỏi',
                    style: const TextStyle(
                      fontSize: 11, color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _catColor(QuizCategory c) => switch (c) {
    QuizCategory.mbti => AppColors.mbtiColor,
    QuizCategory.zodiac => AppColors.zodiacColor,
    QuizCategory.career => AppColors.careerColor,
    QuizCategory.personality => AppColors.personalityColor,
  };

  String _catLabel(QuizCategory c) => switch (c) {
    QuizCategory.mbti => 'MBTI',
    QuizCategory.zodiac => 'CUNG SAO',
    QuizCategory.career => 'NGHỀ NGHIỆP',
    QuizCategory.personality => 'TÍNH CÁCH',
  };

  String _catEmoji(QuizCategory c) => switch (c) {
    QuizCategory.mbti => '🧬',
    QuizCategory.zodiac => '⭐',
    QuizCategory.career => '💼',
    QuizCategory.personality => '🌟',
  };
}
