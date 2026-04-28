import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quiz_category.dart';
import '../../domain/entities/quiz_entity.dart';
import 'question_model.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

/// Model tầng Data cho bài trắc nghiệm.
///
/// Lưu ý: [category] được lưu dưới dạng [String] trong JSON
/// (ví dụ: "personality"), sau đó convert sang enum [QuizCategory]
/// khi tạo Entity. Đây là pattern phổ biến vì JSON/API
/// thường không hiểu Dart enum trực tiếp.
@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    required String id,
    required String title,
    required String description,

    /// Category lưu dạng String trong JSON, ví dụ: "mbti", "career"
    required String category,
    required String imageAsset,
    required List<QuestionModel> questions,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  factory QuizModel.fromEntity(QuizEntity entity) => QuizModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        category: entity.category.name, // enum → String
        imageAsset: entity.imageAsset,
        questions:
            entity.questions.map((q) => QuestionModel.fromEntity(q)).toList(),
      );
}

extension QuizModelX on QuizModel {
  QuizEntity toEntity() => QuizEntity(
        id: id,
        title: title,
        description: description,
        // String → enum: tìm trong QuizCategory.values theo tên
        category: QuizCategory.values.firstWhere(
          (c) => c.name == category,
          orElse: () => QuizCategory.personality,
        ),
        imageAsset: imageAsset,
        questions: questions.map((q) => q.toEntity()).toList(),
      );
}
