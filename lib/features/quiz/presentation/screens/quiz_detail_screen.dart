import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/quiz_result_entity.dart';
import '../../quiz_providers.dart';

class QuizDetailScreen extends ConsumerWidget {
  final String quizId;
  const QuizDetailScreen({super.key, required this.quizId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizAsync = ref.watch(quizByIdProvider(quizId));
    final resultsAsync = ref.watch(quizResultTemplatesProvider(quizId));

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        title: const Text('Chi tiết quiz'),
      ),
      body: quizAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
          ),
        ),
        error: (err, _) => Center(
          child: Text('$err',
              style: const TextStyle(color: AppColors.textSecondary)),
        ),
        data: (quiz) => SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(quiz.title, style: AppTextStyles.displayLarge),
              const SizedBox(height: 8),
              Text(quiz.description, style: AppTextStyles.bodyMedium),
              const SizedBox(height: 18),
              _InfoRow(label: 'Số câu hỏi', value: '${quiz.questions.length}'),
              const SizedBox(height: 22),
              const Text('Kết quả có thể nhận được',
                  style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              resultsAsync.when(
                loading: () => const _SkeletonResults(),
                error: (err, _) => Text('$err',
                    style: const TextStyle(color: AppColors.textMuted)),
                data: (results) => _ResultPreviewList(results: results),
              ),
              const SizedBox(height: 28),
              _StartButton(
                onPressed: () {
                  ref.invalidate(quizPlayProvider);
                  context.push('/home/quiz/$quizId/play');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: AppColors.textMuted)),
        const SizedBox(width: 8),
        Text(value, style: const TextStyle(color: AppColors.textPrimary)),
      ],
    );
  }
}

class _ResultPreviewList extends StatelessWidget {
  final List<QuizResultEntity> results;
  const _ResultPreviewList({required this.results});

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return const Text('Chưa có dữ liệu kết quả.',
          style: TextStyle(color: AppColors.textMuted));
    }

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: results
          .take(4)
          .map((r) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.35),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(r.emoji, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 6),
                    Text(r.title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class _SkeletonResults extends StatelessWidget {
  const _SkeletonResults();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        3,
        (i) => Container(
          width: 110,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _StartButton extends StatefulWidget {
  final VoidCallback onPressed;
  const _StartButton({required this.onPressed});

  @override
  State<_StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<_StartButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 140),
        scale: _pressed ? 0.98 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          height: 56,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.45),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Text(
            'Bắt đầu',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
