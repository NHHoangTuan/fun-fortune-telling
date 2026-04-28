// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizEntity {
  /// ID duy nhất của bài trắc nghiệm
  String get id => throw _privateConstructorUsedError;

  /// Tiêu đề bài trắc nghiệm (ví dụ: "Bạn là kiểu MBTI nào?")
  String get title => throw _privateConstructorUsedError;

  /// Mô tả ngắn về bài trắc nghiệm
  String get description => throw _privateConstructorUsedError;

  /// Phân loại bài trắc nghiệm (MBTI, Zodiac, Career, Personality)
  QuizCategory get category => throw _privateConstructorUsedError;

  /// Đường dẫn tới asset hình ảnh minh hoạ (ví dụ: "assets/images/mbti.png")
  String get imageAsset => throw _privateConstructorUsedError;

  /// Danh sách các câu hỏi trong bài trắc nghiệm
  List<QuestionEntity> get questions => throw _privateConstructorUsedError;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizEntityCopyWith<QuizEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizEntityCopyWith<$Res> {
  factory $QuizEntityCopyWith(
          QuizEntity value, $Res Function(QuizEntity) then) =
      _$QuizEntityCopyWithImpl<$Res, QuizEntity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      QuizCategory category,
      String imageAsset,
      List<QuestionEntity> questions});
}

/// @nodoc
class _$QuizEntityCopyWithImpl<$Res, $Val extends QuizEntity>
    implements $QuizEntityCopyWith<$Res> {
  _$QuizEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? imageAsset = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as QuizCategory,
      imageAsset: null == imageAsset
          ? _value.imageAsset
          : imageAsset // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizEntityImplCopyWith<$Res>
    implements $QuizEntityCopyWith<$Res> {
  factory _$$QuizEntityImplCopyWith(
          _$QuizEntityImpl value, $Res Function(_$QuizEntityImpl) then) =
      __$$QuizEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      QuizCategory category,
      String imageAsset,
      List<QuestionEntity> questions});
}

/// @nodoc
class __$$QuizEntityImplCopyWithImpl<$Res>
    extends _$QuizEntityCopyWithImpl<$Res, _$QuizEntityImpl>
    implements _$$QuizEntityImplCopyWith<$Res> {
  __$$QuizEntityImplCopyWithImpl(
      _$QuizEntityImpl _value, $Res Function(_$QuizEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? imageAsset = null,
    Object? questions = null,
  }) {
    return _then(_$QuizEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as QuizCategory,
      imageAsset: null == imageAsset
          ? _value.imageAsset
          : imageAsset // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionEntity>,
    ));
  }
}

/// @nodoc

class _$QuizEntityImpl implements _QuizEntity {
  const _$QuizEntityImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.imageAsset,
      required final List<QuestionEntity> questions})
      : _questions = questions;

  /// ID duy nhất của bài trắc nghiệm
  @override
  final String id;

  /// Tiêu đề bài trắc nghiệm (ví dụ: "Bạn là kiểu MBTI nào?")
  @override
  final String title;

  /// Mô tả ngắn về bài trắc nghiệm
  @override
  final String description;

  /// Phân loại bài trắc nghiệm (MBTI, Zodiac, Career, Personality)
  @override
  final QuizCategory category;

  /// Đường dẫn tới asset hình ảnh minh hoạ (ví dụ: "assets/images/mbti.png")
  @override
  final String imageAsset;

  /// Danh sách các câu hỏi trong bài trắc nghiệm
  final List<QuestionEntity> _questions;

  /// Danh sách các câu hỏi trong bài trắc nghiệm
  @override
  List<QuestionEntity> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuizEntity(id: $id, title: $title, description: $description, category: $category, imageAsset: $imageAsset, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageAsset, imageAsset) ||
                other.imageAsset == imageAsset) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, category,
      imageAsset, const DeepCollectionEquality().hash(_questions));

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizEntityImplCopyWith<_$QuizEntityImpl> get copyWith =>
      __$$QuizEntityImplCopyWithImpl<_$QuizEntityImpl>(this, _$identity);
}

abstract class _QuizEntity implements QuizEntity {
  const factory _QuizEntity(
      {required final String id,
      required final String title,
      required final String description,
      required final QuizCategory category,
      required final String imageAsset,
      required final List<QuestionEntity> questions}) = _$QuizEntityImpl;

  /// ID duy nhất của bài trắc nghiệm
  @override
  String get id;

  /// Tiêu đề bài trắc nghiệm (ví dụ: "Bạn là kiểu MBTI nào?")
  @override
  String get title;

  /// Mô tả ngắn về bài trắc nghiệm
  @override
  String get description;

  /// Phân loại bài trắc nghiệm (MBTI, Zodiac, Career, Personality)
  @override
  QuizCategory get category;

  /// Đường dẫn tới asset hình ảnh minh hoạ (ví dụ: "assets/images/mbti.png")
  @override
  String get imageAsset;

  /// Danh sách các câu hỏi trong bài trắc nghiệm
  @override
  List<QuestionEntity> get questions;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizEntityImplCopyWith<_$QuizEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
