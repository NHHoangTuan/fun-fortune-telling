import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/question_entity.dart';
import 'option_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

/// Model tầng Data cho một câu hỏi.
///
/// Chứa danh sách [OptionModel] thay vì [OptionEntity],
/// vì ở tầng Data chúng ta làm việc với Models.
@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    required String content,
    required List<OptionModel> options,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  factory QuestionModel.fromEntity(QuestionEntity entity) => QuestionModel(
        id: entity.id,
        content: entity.content,
        options:
            entity.options.map((o) => OptionModel.fromEntity(o)).toList(),
      );
}

extension QuestionModelX on QuestionModel {
  QuestionEntity toEntity() => QuestionEntity(
        id: id,
        content: content,
        options: options.map((o) => o.toEntity()).toList(),
      );
}
