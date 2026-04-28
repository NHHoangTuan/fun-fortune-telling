import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/option_entity.dart';

part 'option_model.freezed.dart';
part 'option_model.g.dart';

/// Model tầng Data cho một lựa chọn trong câu hỏi.
///
/// Khác với [OptionEntity] (domain thuần tuý), model này:
/// - Biết cách parse từ JSON (fromJson / toJson)
/// - Có thể chứa thêm field chỉ tồn tại trong API response (ví dụ: sort_order)
/// - Có thể map sang/từ [OptionEntity] thông qua [toEntity] / [fromEntity]
@freezed
class OptionModel with _$OptionModel {
  const factory OptionModel({
    required String id,
    required String content,
    required String value,
  }) = _OptionModel;

  /// Deserialize từ JSON (API response hoặc file JSON cứng).
  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  /// Tạo OptionModel từ Entity (dùng khi lưu xuống storage).
  factory OptionModel.fromEntity(OptionEntity entity) => OptionModel(
        id: entity.id,
        content: entity.content,
        value: entity.value,
      );
}

/// Extension để convert Model → Entity một cách fluent.
extension OptionModelX on OptionModel {
  OptionEntity toEntity() => OptionEntity(
        id: id,
        content: content,
        value: value,
      );
}
