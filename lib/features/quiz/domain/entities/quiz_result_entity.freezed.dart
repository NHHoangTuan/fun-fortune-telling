// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizResultEntity {
  /// ID của bài trắc nghiệm mà kết quả này thuộc về
  String get quizId => throw _privateConstructorUsedError;

  /// Khoá kết quả dùng để map với dữ liệu (ví dụ: "INFP", "aries", "developer")
  String get resultKey => throw _privateConstructorUsedError;

  /// Tiêu đề kết quả hiển thị cho người dùng (ví dụ: "Người hoà giải")
  String get title => throw _privateConstructorUsedError;

  /// Mô tả chi tiết về kết quả
  String get description => throw _privateConstructorUsedError;

  /// Emoji đại diện cho kết quả (ví dụ: "🦄", "🔥", "💼")
  String get emoji => throw _privateConstructorUsedError;

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultEntityCopyWith<QuizResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultEntityCopyWith<$Res> {
  factory $QuizResultEntityCopyWith(
          QuizResultEntity value, $Res Function(QuizResultEntity) then) =
      _$QuizResultEntityCopyWithImpl<$Res, QuizResultEntity>;
  @useResult
  $Res call(
      {String quizId,
      String resultKey,
      String title,
      String description,
      String emoji});
}

/// @nodoc
class _$QuizResultEntityCopyWithImpl<$Res, $Val extends QuizResultEntity>
    implements $QuizResultEntityCopyWith<$Res> {
  _$QuizResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? resultKey = null,
    Object? title = null,
    Object? description = null,
    Object? emoji = null,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      resultKey: null == resultKey
          ? _value.resultKey
          : resultKey // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResultEntityImplCopyWith<$Res>
    implements $QuizResultEntityCopyWith<$Res> {
  factory _$$QuizResultEntityImplCopyWith(_$QuizResultEntityImpl value,
          $Res Function(_$QuizResultEntityImpl) then) =
      __$$QuizResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String quizId,
      String resultKey,
      String title,
      String description,
      String emoji});
}

/// @nodoc
class __$$QuizResultEntityImplCopyWithImpl<$Res>
    extends _$QuizResultEntityCopyWithImpl<$Res, _$QuizResultEntityImpl>
    implements _$$QuizResultEntityImplCopyWith<$Res> {
  __$$QuizResultEntityImplCopyWithImpl(_$QuizResultEntityImpl _value,
      $Res Function(_$QuizResultEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? resultKey = null,
    Object? title = null,
    Object? description = null,
    Object? emoji = null,
  }) {
    return _then(_$QuizResultEntityImpl(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      resultKey: null == resultKey
          ? _value.resultKey
          : resultKey // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuizResultEntityImpl implements _QuizResultEntity {
  const _$QuizResultEntityImpl(
      {required this.quizId,
      required this.resultKey,
      required this.title,
      required this.description,
      required this.emoji});

  /// ID của bài trắc nghiệm mà kết quả này thuộc về
  @override
  final String quizId;

  /// Khoá kết quả dùng để map với dữ liệu (ví dụ: "INFP", "aries", "developer")
  @override
  final String resultKey;

  /// Tiêu đề kết quả hiển thị cho người dùng (ví dụ: "Người hoà giải")
  @override
  final String title;

  /// Mô tả chi tiết về kết quả
  @override
  final String description;

  /// Emoji đại diện cho kết quả (ví dụ: "🦄", "🔥", "💼")
  @override
  final String emoji;

  @override
  String toString() {
    return 'QuizResultEntity(quizId: $quizId, resultKey: $resultKey, title: $title, description: $description, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultEntityImpl &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.resultKey, resultKey) ||
                other.resultKey == resultKey) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.emoji, emoji) || other.emoji == emoji));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quizId, resultKey, title, description, emoji);

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultEntityImplCopyWith<_$QuizResultEntityImpl> get copyWith =>
      __$$QuizResultEntityImplCopyWithImpl<_$QuizResultEntityImpl>(
          this, _$identity);
}

abstract class _QuizResultEntity implements QuizResultEntity {
  const factory _QuizResultEntity(
      {required final String quizId,
      required final String resultKey,
      required final String title,
      required final String description,
      required final String emoji}) = _$QuizResultEntityImpl;

  /// ID của bài trắc nghiệm mà kết quả này thuộc về
  @override
  String get quizId;

  /// Khoá kết quả dùng để map với dữ liệu (ví dụ: "INFP", "aries", "developer")
  @override
  String get resultKey;

  /// Tiêu đề kết quả hiển thị cho người dùng (ví dụ: "Người hoà giải")
  @override
  String get title;

  /// Mô tả chi tiết về kết quả
  @override
  String get description;

  /// Emoji đại diện cho kết quả (ví dụ: "🦄", "🔥", "💼")
  @override
  String get emoji;

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultEntityImplCopyWith<_$QuizResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
