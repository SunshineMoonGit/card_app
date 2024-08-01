// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletModel {
  List<UserInfoEntity> get recent => throw _privateConstructorUsedError;
  List<UserInfoEntity> get favorites => throw _privateConstructorUsedError;
  List<UserInfoEntity> get followings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {List<UserInfoEntity> recent,
      List<UserInfoEntity> favorites,
      List<UserInfoEntity> followings});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recent = null,
    Object? favorites = null,
    Object? followings = null,
  }) {
    return _then(_value.copyWith(
      recent: null == recent
          ? _value.recent
          : recent // ignore: cast_nullable_to_non_nullable
              as List<UserInfoEntity>,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<UserInfoEntity>,
      followings: null == followings
          ? _value.followings
          : followings // ignore: cast_nullable_to_non_nullable
              as List<UserInfoEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
          _$WalletModelImpl value, $Res Function(_$WalletModelImpl) then) =
      __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserInfoEntity> recent,
      List<UserInfoEntity> favorites,
      List<UserInfoEntity> followings});
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
      _$WalletModelImpl _value, $Res Function(_$WalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recent = null,
    Object? favorites = null,
    Object? followings = null,
  }) {
    return _then(_$WalletModelImpl(
      recent: null == recent
          ? _value._recent
          : recent // ignore: cast_nullable_to_non_nullable
              as List<UserInfoEntity>,
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<UserInfoEntity>,
      followings: null == followings
          ? _value._followings
          : followings // ignore: cast_nullable_to_non_nullable
              as List<UserInfoEntity>,
    ));
  }
}

/// @nodoc

class _$WalletModelImpl implements _WalletModel {
  _$WalletModelImpl(
      {final List<UserInfoEntity> recent = const [],
      final List<UserInfoEntity> favorites = const [],
      final List<UserInfoEntity> followings = const []})
      : _recent = recent,
        _favorites = favorites,
        _followings = followings;

  final List<UserInfoEntity> _recent;
  @override
  @JsonKey()
  List<UserInfoEntity> get recent {
    if (_recent is EqualUnmodifiableListView) return _recent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recent);
  }

  final List<UserInfoEntity> _favorites;
  @override
  @JsonKey()
  List<UserInfoEntity> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  final List<UserInfoEntity> _followings;
  @override
  @JsonKey()
  List<UserInfoEntity> get followings {
    if (_followings is EqualUnmodifiableListView) return _followings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followings);
  }

  @override
  String toString() {
    return 'WalletModel(recent: $recent, favorites: $favorites, followings: $followings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
            const DeepCollectionEquality().equals(other._recent, _recent) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality()
                .equals(other._followings, _followings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recent),
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(_followings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);
}

abstract class _WalletModel implements WalletModel {
  factory _WalletModel(
      {final List<UserInfoEntity> recent,
      final List<UserInfoEntity> favorites,
      final List<UserInfoEntity> followings}) = _$WalletModelImpl;

  @override
  List<UserInfoEntity> get recent;
  @override
  List<UserInfoEntity> get favorites;
  @override
  List<UserInfoEntity> get followings;
  @override
  @JsonKey(ignore: true)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
