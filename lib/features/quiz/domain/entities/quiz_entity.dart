import 'package:freezed_annotation/freezed_annotation.dart';

import 'question_entity.dart';
import 'quiz_category.dart';

part 'quiz_entity.freezed.dart';

/// Entity đại diện cho một bài trắc nghiệm hoàn chỉnh.
///
/// Đây là entity gốc (root entity / aggregate root) của feature quiz.
/// Nó chứa toàn bộ thông tin cần thiết để hiển thị và thực hiện một bài trắc nghiệm.
@freezed
class QuizEntity with _$QuizEntity {
  const factory QuizEntity({
    /// ID duy nhất của bài trắc nghiệm
    required String id,

    /// Tiêu đề bài trắc nghiệm (ví dụ: "Bạn là kiểu MBTI nào?")
    required String title,

    /// Mô tả ngắn về bài trắc nghiệm
    required String description,

    /// Phân loại bài trắc nghiệm (MBTI, Zodiac, Career, Personality)
    required QuizCategory category,

    /// Đường dẫn tới asset hình ảnh minh hoạ (ví dụ: "assets/images/mbti.png")
    required String imageAsset,

    /// Danh sách các câu hỏi trong bài trắc nghiệm
    required List<QuestionEntity> questions,
  }) = _QuizEntity;
}
