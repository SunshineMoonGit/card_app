// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowingModel<T> _$FollowingModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _FollowingModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$FollowingModel<T> {
  T get user => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;
  bool get linked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingModelCopyWith<T, FollowingModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingModelCopyWith<T, $Res> {
  factory $FollowingModelCopyWith(
          FollowingModel<T> value, $Res Function(FollowingModel<T>) then) =
      _$FollowingModelCopyWithImpl<T, $Res, FollowingModel<T>>;
  @useResult
  $Res call({T user, bool favorite, bool linked});
}

/// @nodoc
class _$FollowingModelCopyWithImpl<T, $Res, $Val extends FollowingModel<T>>
    implements $FollowingModelCopyWith<T, $Res> {
  _$FollowingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? favorite = null,
    Object? linked = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as T,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      linked: null == linked
          ? _value.linked
          : linked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingModelImplCopyWith<T, $Res>
    implements $FollowingModelCopyWith<T, $Res> {
  factory _$$FollowingModelImplCopyWith(_$FollowingModelImpl<T> value,
          $Res Function(_$FollowingModelImpl<T>) then) =
      __$$FollowingModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T user, bool favorite, bool linked});
}

/// @nodoc
class __$$FollowingModelImplCopyWithImpl<T, $Res>
    extends _$FollowingModelCopyWithImpl<T, $Res, _$FollowingModelImpl<T>>
    implements _$$FollowingModelImplCopyWith<T, $Res> {
  __$$FollowingModelImplCopyWithImpl(_$FollowingModelImpl<T> _value,
      $Res Function(_$FollowingModelImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? favorite = null,
    Object? linked = null,
  }) {
    return _then(_$FollowingModelImpl<T>(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as T,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      linked: null == linked
          ? _value.linked
          : linked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$FollowingModelImpl<T> extends _FollowingModel<T> {
  _$FollowingModelImpl(
      {required this.user, this.favorite = false, this.linked = false})
      : super._();

  factory _$FollowingModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$FollowingModelImplFromJson(json, fromJsonT);

  @override
  final T user;
  @override
  @JsonKey()
  final bool favorite;
  @override
  @JsonKey()
  final bool linked;

  @override
  String toString() {
    return 'FollowingModel<$T>(user: $user, favorite: $favorite, linked: $linked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingModelImpl<T> &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.linked, linked) || other.linked == linked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(user), favorite, linked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingModelImplCopyWith<T, _$FollowingModelImpl<T>> get copyWith =>
      __$$FollowingModelImplCopyWithImpl<T, _$FollowingModelImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$FollowingModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _FollowingModel<T> extends FollowingModel<T> {
  factory _FollowingModel(
      {required final T user,
      final bool favorite,
      final bool linked}) = _$FollowingModelImpl<T>;
  _FollowingModel._() : super._();

  factory _FollowingModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$FollowingModelImpl<T>.fromJson;

  @override
  T get user;
  @override
  bool get favorite;
  @override
  bool get linked;
  @override
  @JsonKey(ignore: true)
  _$$FollowingModelImplCopyWith<T, _$FollowingModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
