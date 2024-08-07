// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FollowingEntity<T> {
  T get user => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;
  bool get linked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowingEntityCopyWith<T, FollowingEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingEntityCopyWith<T, $Res> {
  factory $FollowingEntityCopyWith(
          FollowingEntity<T> value, $Res Function(FollowingEntity<T>) then) =
      _$FollowingEntityCopyWithImpl<T, $Res, FollowingEntity<T>>;
  @useResult
  $Res call({T user, bool favorite, bool linked});
}

/// @nodoc
class _$FollowingEntityCopyWithImpl<T, $Res, $Val extends FollowingEntity<T>>
    implements $FollowingEntityCopyWith<T, $Res> {
  _$FollowingEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$FollowingEntityImplCopyWith<T, $Res>
    implements $FollowingEntityCopyWith<T, $Res> {
  factory _$$FollowingEntityImplCopyWith(_$FollowingEntityImpl<T> value,
          $Res Function(_$FollowingEntityImpl<T>) then) =
      __$$FollowingEntityImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T user, bool favorite, bool linked});
}

/// @nodoc
class __$$FollowingEntityImplCopyWithImpl<T, $Res>
    extends _$FollowingEntityCopyWithImpl<T, $Res, _$FollowingEntityImpl<T>>
    implements _$$FollowingEntityImplCopyWith<T, $Res> {
  __$$FollowingEntityImplCopyWithImpl(_$FollowingEntityImpl<T> _value,
      $Res Function(_$FollowingEntityImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? favorite = null,
    Object? linked = null,
  }) {
    return _then(_$FollowingEntityImpl<T>(
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

class _$FollowingEntityImpl<T> implements _FollowingEntity<T> {
  _$FollowingEntityImpl(
      {required this.user, this.favorite = false, this.linked = false});

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
    return 'FollowingEntity<$T>(user: $user, favorite: $favorite, linked: $linked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingEntityImpl<T> &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.linked, linked) || other.linked == linked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(user), favorite, linked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingEntityImplCopyWith<T, _$FollowingEntityImpl<T>> get copyWith =>
      __$$FollowingEntityImplCopyWithImpl<T, _$FollowingEntityImpl<T>>(
          this, _$identity);
}

abstract class _FollowingEntity<T> implements FollowingEntity<T> {
  factory _FollowingEntity(
      {required final T user,
      final bool favorite,
      final bool linked}) = _$FollowingEntityImpl<T>;

  @override
  T get user;
  @override
  bool get favorite;
  @override
  bool get linked;
  @override
  @JsonKey(ignore: true)
  _$$FollowingEntityImplCopyWith<T, _$FollowingEntityImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
