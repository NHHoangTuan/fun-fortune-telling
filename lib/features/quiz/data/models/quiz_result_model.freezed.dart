// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizResultModel _$QuizResultModelFromJson(Map<String, dynamic> json) {
  return _QuizResultModel.fromJson(json);
}

/// @nodoc
mixin _$QuizResultModel {
  @HiveField(0)
  String get quizId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get resultKey => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  String get emoji => throw _privateConstructorUsedError;

  /// Thời điểm lưu kết quả — field này chỉ tồn tại ở Model (Data Layer),
  /// không có trong Entity vì domain không quan tâm đến storage timestamp.
  @HiveField(5)
  DateTime get savedAt => throw _privateConstructorUsedError;

  /// Serializes this QuizResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultModelCopyWith<QuizResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultModelCopyWith<$Res> {
  factory $QuizResultModelCopyWith(
          QuizResultModel value, $Res Function(QuizResultModel) then) =
      _$QuizResultModelCopyWithImpl<$Res, QuizResultModel>;
  @useResult
  $Res call(
      {@HiveField(0) String quizId,
      @HiveField(1) String resultKey,
      @HiveField(2) String title,
      @HiveField(3) String description,
      @HiveField(4) String emoji,
      @HiveField(5) DateTime savedAt});
}

/// @nodoc
class _$QuizResultModelCopyWithImpl<$Res, $Val extends QuizResultModel>
    implements $QuizResultModelCopyWith<$Res> {
  _$QuizResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? resultKey = null,
    Object? title = null,
    Object? description = null,
    Object? emoji = null,
    Object? savedAt = null,
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
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResultModelImplCopyWith<$Res>
    implements $QuizResultModelCopyWith<$Res> {
  factory _$$QuizResultModelImplCopyWith(_$QuizResultModelImpl value,
          $Res Function(_$QuizResultModelImpl) then) =
      __$$QuizResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String quizId,
      @HiveField(1) String resultKey,
      @HiveField(2) String title,
      @HiveField(3) String description,
      @HiveField(4) String emoji,
      @HiveField(5) DateTime savedAt});
}

/// @nodoc
class __$$QuizResultModelImplCopyWithImpl<$Res>
    extends _$QuizResultModelCopyWithImpl<$Res, _$QuizResultModelImpl>
    implements _$$QuizResultModelImplCopyWith<$Res> {
  __$$QuizResultModelImplCopyWithImpl(
      _$QuizResultModelImpl _value, $Res Function(_$QuizResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? resultKey = null,
    Object? title = null,
    Object? description = null,
    Object? emoji = null,
    Object? savedAt = null,
  }) {
    return _then(_$QuizResultModelImpl(
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
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultModelImpl implements _QuizResultModel {
  const _$QuizResultModelImpl(
      {@HiveField(0) required this.quizId,
      @HiveField(1) required this.resultKey,
      @HiveField(2) required this.title,
      @HiveField(3) required this.description,
      @HiveField(4) required this.emoji,
      @HiveField(5) required this.savedAt});

  factory _$QuizResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultModelImplFromJson(json);

  @override
  @HiveField(0)
  final String quizId;
  @override
  @HiveField(1)
  final String resultKey;
  @override
  @HiveField(2)
  final String title;
  @override
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final String emoji;

  /// Thời điểm lưu kết quả — field này chỉ tồn tại ở Model (Data Layer),
  /// không có trong Entity vì domain không quan tâm đến storage timestamp.
  @override
  @HiveField(5)
  final DateTime savedAt;

  @override
  String toString() {
    return 'QuizResultModel(quizId: $quizId, resultKey: $resultKey, title: $title, description: $description, emoji: $emoji, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultModelImpl &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.resultKey, resultKey) ||
                other.resultKey == resultKey) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, quizId, resultKey, title, description, emoji, savedAt);

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      __$$QuizResultModelImplCopyWithImpl<_$QuizResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultModelImplToJson(
      this,
    );
  }
}

abstract class _QuizResultModel implements QuizResultModel {
  const factory _QuizResultModel(
      {@HiveField(0) required final String quizId,
      @HiveField(1) required final String resultKey,
      @HiveField(2) required final String title,
      @HiveField(3) required final String description,
      @HiveField(4) required final String emoji,
      @HiveField(5) required final DateTime savedAt}) = _$QuizResultModelImpl;

  factory _QuizResultModel.fromJson(Map<String, dynamic> json) =
      _$QuizResultModelImpl.fromJson;

  @override
  @HiveField(0)
  String get quizId;
  @override
  @HiveField(1)
  String get resultKey;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  String get emoji;

  /// Thời điểm lưu kết quả — field này chỉ tồn tại ở Model (Data Layer),
  /// không có trong Entity vì domain không quan tâm đến storage timestamp.
  @override
  @HiveField(5)
  DateTime get savedAt;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
