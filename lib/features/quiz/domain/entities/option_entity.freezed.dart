// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OptionEntity {
  /// ID duy nhất của lựa chọn
  String get id => throw _privateConstructorUsedError;

  /// Nội dung hiển thị cho người dùng (ví dụ: "Đọc sách ở nhà")
  String get content => throw _privateConstructorUsedError;

  /// Giá trị dùng để tính kết quả (ví dụ: "I", "E", "A", "B")
  /// Giá trị này KHÔNG hiển thị cho người dùng, chỉ dùng trong logic tính điểm
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of OptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionEntityCopyWith<OptionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionEntityCopyWith<$Res> {
  factory $OptionEntityCopyWith(
          OptionEntity value, $Res Function(OptionEntity) then) =
      _$OptionEntityCopyWithImpl<$Res, OptionEntity>;
  @useResult
  $Res call({String id, String content, String value});
}

/// @nodoc
class _$OptionEntityCopyWithImpl<$Res, $Val extends OptionEntity>
    implements $OptionEntityCopyWith<$Res> {
  _$OptionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionEntityImplCopyWith<$Res>
    implements $OptionEntityCopyWith<$Res> {
  factory _$$OptionEntityImplCopyWith(
          _$OptionEntityImpl value, $Res Function(_$OptionEntityImpl) then) =
      __$$OptionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String content, String value});
}

/// @nodoc
class __$$OptionEntityImplCopyWithImpl<$Res>
    extends _$OptionEntityCopyWithImpl<$Res, _$OptionEntityImpl>
    implements _$$OptionEntityImplCopyWith<$Res> {
  __$$OptionEntityImplCopyWithImpl(
      _$OptionEntityImpl _value, $Res Function(_$OptionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? value = null,
  }) {
    return _then(_$OptionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OptionEntityImpl implements _OptionEntity {
  const _$OptionEntityImpl(
      {required this.id, required this.content, required this.value});

  /// ID duy nhất của lựa chọn
  @override
  final String id;

  /// Nội dung hiển thị cho người dùng (ví dụ: "Đọc sách ở nhà")
  @override
  final String content;

  /// Giá trị dùng để tính kết quả (ví dụ: "I", "E", "A", "B")
  /// Giá trị này KHÔNG hiển thị cho người dùng, chỉ dùng trong logic tính điểm
  @override
  final String value;

  @override
  String toString() {
    return 'OptionEntity(id: $id, content: $content, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, content, value);

  /// Create a copy of OptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionEntityImplCopyWith<_$OptionEntityImpl> get copyWith =>
      __$$OptionEntityImplCopyWithImpl<_$OptionEntityImpl>(this, _$identity);
}

abstract class _OptionEntity implements OptionEntity {
  const factory _OptionEntity(
      {required final String id,
      required final String content,
      required final String value}) = _$OptionEntityImpl;

  /// ID duy nhất của lựa chọn
  @override
  String get id;

  /// Nội dung hiển thị cho người dùng (ví dụ: "Đọc sách ở nhà")
  @override
  String get content;

  /// Giá trị dùng để tính kết quả (ví dụ: "I", "E", "A", "B")
  /// Giá trị này KHÔNG hiển thị cho người dùng, chỉ dùng trong logic tính điểm
  @override
  String get value;

  /// Create a copy of OptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionEntityImplCopyWith<_$OptionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
