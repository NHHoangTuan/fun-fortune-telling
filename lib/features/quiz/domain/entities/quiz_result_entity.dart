import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result_entity.freezed.dart';

/// Entity đại diện cho kết quả sau khi hoàn thành bài trắc nghiệm.
///
/// Ví dụ: Sau khi làm xong trắc nghiệm MBTI, kết quả có thể là:
/// - resultKey: "INFP"
/// - title: "Người hoà giải"
/// - description: "Bạn là người lý tưởng, sáng tạo..."
/// - emoji: "🦄"
@freezed
class QuizResultEntity with _$QuizResultEntity {
  const factory QuizResultEntity({
    /// ID của bài trắc nghiệm mà kết quả này thuộc về
    required String quizId,

    /// Khoá kết quả dùng để map với dữ liệu (ví dụ: "INFP", "aries", "developer")
    required String resultKey,

    /// Tiêu đề kết quả hiển thị cho người dùng (ví dụ: "Người hoà giải")
    required String title,

    /// Mô tả chi tiết về kết quả
    required String description,

    /// Emoji đại diện cho kết quả (ví dụ: "🦄", "🔥", "💼")
    required String emoji,
  }) = _QuizResultEntity;
}
