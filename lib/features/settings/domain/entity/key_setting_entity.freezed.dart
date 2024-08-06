// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KeySettingEntity _$KeySettingEntityFromJson(Map<String, dynamic> json) {
  return _KeySettingEntity.fromJson(json);
}

/// @nodoc
mixin _$KeySettingEntity {
  String? get uid => throw _privateConstructorUsedError;
  String get updateTime => throw _privateConstructorUsedError;
  @SsListStringConverter()
  List<String> get favorites => throw _privateConstructorUsedError;
  @SsListStringConverter()
  List<String> get recent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeySettingEntityCopyWith<KeySettingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeySettingEntityCopyWith<$Res> {
  factory $KeySettingEntityCopyWith(
          KeySettingEntity value, $Res Function(KeySettingEntity) then) =
      _$KeySettingEntityCopyWithImpl<$Res, KeySettingEntity>;
  @useResult
  $Res call(
      {String? uid,
      String updateTime,
      @SsListStringConverter() List<String> favorites,
      @SsListStringConverter() List<String> recent});
}

/// @nodoc
class _$KeySettingEntityCopyWithImpl<$Res, $Val extends KeySettingEntity>
    implements $KeySettingEntityCopyWith<$Res> {
  _$KeySettingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? updateTime = null,
    Object? favorites = null,
    Object? recent = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recent: null == recent
          ? _value.recent
          : recent // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeySettingEntityImplCopyWith<$Res>
    implements $KeySettingEntityCopyWith<$Res> {
  factory _$$KeySettingEntityImplCopyWith(_$KeySettingEntityImpl value,
          $Res Function(_$KeySettingEntityImpl) then) =
      __$$KeySettingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String updateTime,
      @SsListStringConverter() List<String> favorites,
      @SsListStringConverter() List<String> recent});
}

/// @nodoc
class __$$KeySettingEntityImplCopyWithImpl<$Res>
    extends _$KeySettingEntityCopyWithImpl<$Res, _$KeySettingEntityImpl>
    implements _$$KeySettingEntityImplCopyWith<$Res> {
  __$$KeySettingEntityImplCopyWithImpl(_$KeySettingEntityImpl _value,
      $Res Function(_$KeySettingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? updateTime = null,
    Object? favorites = null,
    Object? recent = null,
  }) {
    return _then(_$KeySettingEntityImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recent: null == recent
          ? _value._recent
          : recent // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeySettingEntityImpl implements _KeySettingEntity {
  _$KeySettingEntityImpl(
      {this.uid,
      required this.updateTime,
      @SsListStringConverter() required final List<String> favorites,
      @SsListStringConverter() required final List<String> recent})
      : _favorites = favorites,
        _recent = recent;

  factory _$KeySettingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeySettingEntityImplFromJson(json);

  @override
  final String? uid;
  @override
  final String updateTime;
  final List<String> _favorites;
  @override
  @SsListStringConverter()
  List<String> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  final List<String> _recent;
  @override
  @SsListStringConverter()
  List<String> get recent {
    if (_recent is EqualUnmodifiableListView) return _recent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recent);
  }

  @override
  String toString() {
    return 'KeySettingEntity(uid: $uid, updateTime: $updateTime, favorites: $favorites, recent: $recent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeySettingEntityImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality().equals(other._recent, _recent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      updateTime,
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(_recent));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeySettingEntityImplCopyWith<_$KeySettingEntityImpl> get copyWith =>
      __$$KeySettingEntityImplCopyWithImpl<_$KeySettingEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeySettingEntityImplToJson(
      this,
    );
  }
}

abstract class _KeySettingEntity implements KeySettingEntity {
  factory _KeySettingEntity(
          {final String? uid,
          required final String updateTime,
          @SsListStringConverter() required final List<String> favorites,
          @SsListStringConverter() required final List<String> recent}) =
      _$KeySettingEntityImpl;

  factory _KeySettingEntity.fromJson(Map<String, dynamic> json) =
      _$KeySettingEntityImpl.fromJson;

  @override
  String? get uid;
  @override
  String get updateTime;
  @override
  @SsListStringConverter()
  List<String> get favorites;
  @override
  @SsListStringConverter()
  List<String> get recent;
  @override
  @JsonKey(ignore: true)
  _$$KeySettingEntityImplCopyWith<_$KeySettingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
