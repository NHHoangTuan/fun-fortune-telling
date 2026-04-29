import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/quiz_result_entity.dart';

class QuizPlayState {
  final int currentQuestionIndex;
  final Map<String, String> selectedAnswers;
  final bool isCompleted;

  const QuizPlayState({
    this.currentQuestionIndex = 0,
    this.selectedAnswers = const {},
    this.isCompleted = false,
  });

  QuizPlayState copyWith({
    int? currentQuestionIndex,
    Map<String, String>? selectedAnswers,
    bool? isCompleted,
  }) {
    return QuizPlayState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class QuizPlayNotifier extends Notifier<QuizPlayState> {
  // Notifier: state gắn với logic UI feature; StateNotifier khi cần API cũ;
  // StateProvider chỉ hợp cho state cực đơn giản.
  @override
  QuizPlayState build() => const QuizPlayState();

  void reset() {
    state = const QuizPlayState();
  }

  Future<void> selectAnswer({
    required String questionId,
    required String value,
    required int totalQuestions,
  }) async {
    if (state.isCompleted || state.selectedAnswers.containsKey(questionId)) {
      return;
    }

    final updated = Map<String, String>.from(state.selectedAnswers)
      ..[questionId] = value;
    state = state.copyWith(selectedAnswers: updated);

    final isLast = state.currentQuestionIndex >= totalQuestions - 1;
    if (isLast) {
      state = state.copyWith(isCompleted: true);
      return;
    }

    await Future.delayed(const Duration(milliseconds: 500));
    state =
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
  }

  QuizResultEntity computeResult({
    required String quizId,
    required List<QuizResultEntity> templates,
  }) {
    // Business logic như map kết quả nên nằm ở UseCase; tạm đặt đây để UI gọn.
    final scores = <String, int>{};
    for (final value in state.selectedAnswers.values) {
      scores[value] = (scores[value] ?? 0) + 1;
    }
    if (scores.isEmpty) {
      return templates.first;
    }
    final key = scores.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
    final template = templates.firstWhere(
      (t) => t.resultKey == key,
      orElse: () => templates.first,
    );
    return template.copyWith(quizId: quizId);
  }
}
