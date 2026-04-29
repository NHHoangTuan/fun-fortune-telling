import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

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
    final screenshotController = ScreenshotController();
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
            Screenshot(
              controller: screenshotController,
              child: _ResultCard(result: result),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                final text = _shareText(result);
                await Share.share(text, subject: 'Kết quả trắc nghiệm');
              },
              icon: const Icon(Icons.share_rounded),
              label: const Text('Chia sẻ'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () async {
                final bytes = await screenshotController.capture(
                  pixelRatio: 2.5,
                );
                if (bytes == null) {
                  await Share.share(
                    _shareText(result),
                    subject: 'Kết quả trắc nghiệm',
                  );
                  return;
                }
                final dir = await getTemporaryDirectory();
                final file = File(
                  '${dir.path}/quiz_result_${DateTime.now().millisecondsSinceEpoch}.png',
                );
                await file.writeAsBytes(bytes);
                await Share.shareXFiles(
                  [XFile(file.path)],
                  text: _shareText(result),
                  subject: 'Kết quả trắc nghiệm',
                );
              },
              icon: const Icon(Icons.image_rounded),
              label: const Text('Chia sẻ ảnh'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                side: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.6),
                ),
              ),
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

class _ResultCard extends StatelessWidget {
  final QuizResultEntity result;
  const _ResultCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
      ),
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
        ],
      ),
    );
  }
}

String _shareText(QuizResultEntity result) {
  return '🔮 Kết quả của mình: ${result.title} ${result.emoji}\n'
      '${result.description}\n\n'
      'Bạn thử ngay xem kết quả của bạn là gì nhé! ✨';
}
