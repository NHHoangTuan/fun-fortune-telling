import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/quiz_result_entity.dart';
import '../../quiz_providers.dart';

class QuizHistoryScreen extends ConsumerWidget {
  const QuizHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(quizHistoryProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        title: const Text('Lịch sử'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: historyAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
          ),
        ),
        error: (err, _) => Center(
          child: Text('$err',
              style: const TextStyle(color: AppColors.textSecondary)),
        ),
        data: (history) {
          if (history.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('🕰️', style: TextStyle(fontSize: 48)),
                    const SizedBox(height: 10),
                    const Text('Chưa có kết quả nào.',
                        style: TextStyle(color: AppColors.textMuted)),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () => context.go('/home'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                        side: BorderSide(
                          color: AppColors.primary.withValues(alpha: 0.6),
                        ),
                      ),
                      child: const Text('Làm quiz ngay'),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            itemCount: history.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, i) => _HistoryTile(
              result: history[i],
              onDelete: () async {
                await ref
                    .read(deleteQuizResultUseCaseProvider)
                    .execute(history[i]);
                ref.invalidate(quizHistoryProvider);
              },
            ),
          );
        },
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final QuizResultEntity result;
  final Future<void> Function() onDelete;
  const _HistoryTile({required this.result, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final key = '${result.quizId}_${result.resultKey}_${result.title}';

    return Dismissible(
      key: ValueKey(key),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_rounded, color: AppColors.error),
      ),
      onDismissed: (_) => onDelete(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(result.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(result.title, style: AppTextStyles.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    result.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
