import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/quiz_result_entity.dart';

part 'quiz_result_model.freezed.dart';
part 'quiz_result_model.g.dart';

/// Model tầng Data cho kết quả trắc nghiệm.
///
/// Đây là model ĐẶC BIỆT: nó được lưu xuống Hive (local DB)
/// nên có thêm annotation @HiveType và @HiveField.
///
/// ### Về Hive Annotations:
/// - @HiveType(typeId: N): Đăng ký kiểu dữ liệu với Hive, typeId phải unique toàn app.
///   Hive dùng typeId để biết đây là loại object gì khi đọc ra từ binary storage.
/// - @HiveField(N): Đánh số thứ tự field trong binary format.
///   QUAN TRỌNG: Một khi đã dùng typeId/fieldId nào, ĐỪNG BAO GIỜ thay đổi
///   nếu không muốn corrupt data cũ.
@HiveType(typeId: 0)
@freezed
class QuizResultModel with _$QuizResultModel {
  const factory QuizResultModel({
    @HiveField(0) required String quizId,
    @HiveField(1) required String resultKey,
    @HiveField(2) required String title,
    @HiveField(3) required String description,
    @HiveField(4) required String emoji,

    /// Thời điểm lưu kết quả — field này chỉ tồn tại ở Model (Data Layer),
    /// không có trong Entity vì domain không quan tâm đến storage timestamp.
    @HiveField(5) required DateTime savedAt,
  }) = _QuizResultModel;

  factory QuizResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizResultModelFromJson(json);

  /// Tạo QuizResultModel từ Entity, tự động thêm timestamp hiện tại.
  factory QuizResultModel.fromEntity(QuizResultEntity entity) =>
      QuizResultModel(
        quizId: entity.quizId,
        resultKey: entity.resultKey,
        title: entity.title,
        description: entity.description,
        emoji: entity.emoji,
        savedAt: DateTime.now(), // ← Timestamp chỉ tạo ở Data Layer
      );
}

extension QuizResultModelX on QuizResultModel {
  QuizResultEntity toEntity() => QuizResultEntity(
        quizId: quizId,
        resultKey: resultKey,
        title: title,
        description: description,
        emoji: emoji,
        // savedAt không có trong Entity → bị bỏ đi khi convert lên Domain
      );
}
