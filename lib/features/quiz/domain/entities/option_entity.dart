import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_entity.freezed.dart';

/// Entity đại diện cho một lựa chọn trong câu hỏi trắc nghiệm.
///
/// Ví dụ: Câu hỏi "Bạn thích làm gì vào cuối tuần?"
/// → Option: "Đọc sách ở nhà" với [value] = "I" (hướng nội trong MBTI)
@freezed
class OptionEntity with _$OptionEntity {
  const factory OptionEntity({
    /// ID duy nhất của lựa chọn
    required String id,

    /// Nội dung hiển thị cho người dùng (ví dụ: "Đọc sách ở nhà")
    required String content,

    /// Giá trị dùng để tính kết quả (ví dụ: "I", "E", "A", "B")
    /// Giá trị này KHÔNG hiển thị cho người dùng, chỉ dùng trong logic tính điểm
    required String value,
  }) = _OptionEntity;
}
