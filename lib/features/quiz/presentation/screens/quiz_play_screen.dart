import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../quiz_providers.dart';
import '../state/quiz_play_notifier.dart';

final _quizResultNavGuardProvider =
    StateProvider.family<bool, String>((ref, _) => false);

class QuizPlayScreen extends ConsumerWidget {
  final String quizId;
  const QuizPlayScreen({super.key, required this.quizId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizAsync = ref.watch(quizByIdProvider(quizId));
    final templatesAsync = ref.watch(quizResultTemplatesProvider(quizId));
    final playState = ref.watch(quizPlayProvider);
    final hasNavigated = ref.watch(_quizResultNavGuardProvider(quizId));

    if (!playState.isCompleted &&
        playState.currentQuestionIndex == 0 &&
        playState.selectedAnswers.isEmpty &&
        hasNavigated) {
      Future.microtask(() {
        ref.read(_quizResultNavGuardProvider(quizId).notifier).state = false;
      });
    }

    if (playState.isCompleted && !hasNavigated) {
      final templates = templatesAsync.valueOrNull;
      if (templates != null && templates.isNotEmpty) {
        Future.microtask(() {
          ref.read(_quizResultNavGuardProvider(quizId).notifier).state = true;
          final result = ref
              .read(quizPlayProvider.notifier)
              .computeResult(quizId: quizId, templates: templates);
          if (context.mounted) {
            context.push('/home/result', extra: result);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        title: const Text('Làm quiz'),
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
        data: (quiz) => _QuizPlayBody(
          quiz: quiz,
          state: playState,
          onAnswer: (questionId, value) =>
              ref.read(quizPlayProvider.notifier).selectAnswer(
                    questionId: questionId,
                    value: value,
                    totalQuestions: quiz.questions.length,
                  ),
        ),
      ),
    );
  }
}

class _QuizPlayBody extends StatelessWidget {
  final QuizEntity quiz;
  final QuizPlayState state;
  final void Function(String, String) onAnswer;
  const _QuizPlayBody({
    required this.quiz,
    required this.state,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final total = quiz.questions.length;
    final current = state.currentQuestionIndex.clamp(0, total - 1);
    final question = quiz.questions[current];
    final progress = (current + 1) / total;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${current + 1}/$total',
              style: const TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 8),
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 320),
            tween: Tween(begin: 0, end: progress),
            builder: (_, value, __) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 8,
                backgroundColor: AppColors.bgCard,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.accent),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(question.content, style: AppTextStyles.headlineMedium),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.separated(
              itemCount: question.options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => _OptionCard(
                question: question,
                optionIndex: i,
                selectedValue: state.selectedAnswers[question.id],
                onTap: (value) => onAnswer(question.id, value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final QuestionEntity question;
  final int optionIndex;
  final String? selectedValue;
  final void Function(String) onTap;
  const _OptionCard({
    required this.question,
    required this.optionIndex,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final option = question.options[optionIndex];
    final isSelected = selectedValue == option.value;

    return GestureDetector(
      onTap: () => onTap(option.value),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 160),
        scale: isSelected ? 1.02 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.18)
                : AppColors.bgCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected
                  ? AppColors.accent
                  : AppColors.primary.withValues(alpha: 0.25),
              width: isSelected ? 1.4 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            option.content,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
