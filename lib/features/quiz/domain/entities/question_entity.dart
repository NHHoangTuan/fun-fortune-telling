import 'package:freezed_annotation/freezed_annotation.dart';

import 'option_entity.dart';

part 'question_entity.freezed.dart';

/// Entity đại diện cho một câu hỏi trong bài trắc nghiệm.
///
/// Mỗi câu hỏi chứa danh sách các [options] để người dùng chọn.
/// Ví dụ: "Khi gặp người lạ, bạn thường?"
/// → options: ["Chủ động bắt chuyện", "Chờ họ nói trước"]
@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    /// ID duy nhất của câu hỏi
    required String id,

    /// Nội dung câu hỏi hiển thị cho người dùng
    required String content,

    /// Danh sách các lựa chọn (thường từ 2-4 options)
    required List<OptionEntity> options,
  }) = _QuestionEntity;
}
