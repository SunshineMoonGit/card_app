// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomSettingEntity _$CustomSettingEntityFromJson(Map<String, dynamic> json) {
  return _CustomSettingEntity.fromJson(json);
}

/// @nodoc
mixin _$CustomSettingEntity {
  bool get darkMode => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomSettingEntityCopyWith<CustomSettingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomSettingEntityCopyWith<$Res> {
  factory $CustomSettingEntityCopyWith(
          CustomSettingEntity value, $Res Function(CustomSettingEntity) then) =
      _$CustomSettingEntityCopyWithImpl<$Res, CustomSettingEntity>;
  @useResult
  $Res call({bool darkMode, String? language, bool notificationsEnabled});
}

/// @nodoc
class _$CustomSettingEntityCopyWithImpl<$Res, $Val extends CustomSettingEntity>
    implements $CustomSettingEntityCopyWith<$Res> {
  _$CustomSettingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? language = freezed,
    Object? notificationsEnabled = null,
  }) {
    return _then(_value.copyWith(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomSettingEntityImplCopyWith<$Res>
    implements $CustomSettingEntityCopyWith<$Res> {
  factory _$$CustomSettingEntityImplCopyWith(_$CustomSettingEntityImpl value,
          $Res Function(_$CustomSettingEntityImpl) then) =
      __$$CustomSettingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool darkMode, String? language, bool notificationsEnabled});
}

/// @nodoc
class __$$CustomSettingEntityImplCopyWithImpl<$Res>
    extends _$CustomSettingEntityCopyWithImpl<$Res, _$CustomSettingEntityImpl>
    implements _$$CustomSettingEntityImplCopyWith<$Res> {
  __$$CustomSettingEntityImplCopyWithImpl(_$CustomSettingEntityImpl _value,
      $Res Function(_$CustomSettingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? language = freezed,
    Object? notificationsEnabled = null,
  }) {
    return _then(_$CustomSettingEntityImpl(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomSettingEntityImpl implements _CustomSettingEntity {
  _$CustomSettingEntityImpl(
      {required this.darkMode,
      this.language,
      required this.notificationsEnabled});

  factory _$CustomSettingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomSettingEntityImplFromJson(json);

  @override
  final bool darkMode;
  @override
  final String? language;
  @override
  final bool notificationsEnabled;

  @override
  String toString() {
    return 'CustomSettingEntity(darkMode: $darkMode, language: $language, notificationsEnabled: $notificationsEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomSettingEntityImpl &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, darkMode, language, notificationsEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomSettingEntityImplCopyWith<_$CustomSettingEntityImpl> get copyWith =>
      __$$CustomSettingEntityImplCopyWithImpl<_$CustomSettingEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomSettingEntityImplToJson(
      this,
    );
  }
}

abstract class _CustomSettingEntity implements CustomSettingEntity {
  factory _CustomSettingEntity(
      {required final bool darkMode,
      final String? language,
      required final bool notificationsEnabled}) = _$CustomSettingEntityImpl;

  factory _CustomSettingEntity.fromJson(Map<String, dynamic> json) =
      _$CustomSettingEntityImpl.fromJson;

  @override
  bool get darkMode;
  @override
  String? get language;
  @override
  bool get notificationsEnabled;
  @override
  @JsonKey(ignore: true)
  _$$CustomSettingEntityImplCopyWith<_$CustomSettingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
