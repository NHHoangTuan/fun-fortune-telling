import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/quiz_result_entity.dart';
import '../../quiz_providers.dart';

final _resultSaveGuardProvider = StateProvider.family<bool, String>((ref, _) {
  return false;
});

class QuizResultScreen extends ConsumerWidget {
  final QuizResultEntity result;
  const QuizResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guardKey = '${result.quizId}_${result.resultKey}_${result.title}';
    final saved = ref.watch(_resultSaveGuardProvider(guardKey));

    if (!saved) {
      Future.microtask(() async {
        await ref.read(saveQuizResultUseCaseProvider).execute(result);
        ref.read(_resultSaveGuardProvider(guardKey).notifier).state = true;
        ref.invalidate(quizHistoryProvider);
      });
    }

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        title: const Text('Kết quả'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        child: Column(
          children: [
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 900),
              tween: Tween(begin: 0.7, end: 1.0),
              curve: Curves.elasticOut,
              builder: (_, value, child) => Transform.scale(
                scale: value,
                child: child,
              ),
              child: Text(result.emoji, style: const TextStyle(fontSize: 96)),
            ),
            const SizedBox(height: 10),
            Text(result.title, style: AppTextStyles.displayLarge),
            const SizedBox(height: 10),
            Text(
              result.description,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                final text = '${result.title}\n${result.description}';
                await Clipboard.setData(ClipboardData(text: text));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã copy kết quả!')),
                  );
                }
              },
              icon: const Icon(Icons.share_rounded),
              label: const Text('Chia sẻ'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ref.invalidate(quizPlayProvider);
                      context.go('/home/quiz/${result.quizId}/play');
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: BorderSide(
                        color: AppColors.primary.withValues(alpha: 0.6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Chơi lại'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.go('/home'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: BorderSide(
                        color: AppColors.primary.withValues(alpha: 0.6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Về trang chủ'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
