// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ss_external_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SsExternalModel _$SsExternalModelFromJson(Map<String, dynamic> json) {
  return _SsExternalModel.fromJson(json);
}

/// @nodoc
mixin _$SsExternalModel {
  String get platform => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  @FunctionConverter()
  Future<void> Function()? get onTap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SsExternalModelCopyWith<SsExternalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SsExternalModelCopyWith<$Res> {
  factory $SsExternalModelCopyWith(
          SsExternalModel value, $Res Function(SsExternalModel) then) =
      _$SsExternalModelCopyWithImpl<$Res, SsExternalModel>;
  @useResult
  $Res call(
      {String platform,
      String key,
      @FunctionConverter() Future<void> Function()? onTap});
}

/// @nodoc
class _$SsExternalModelCopyWithImpl<$Res, $Val extends SsExternalModel>
    implements $SsExternalModelCopyWith<$Res> {
  _$SsExternalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? key = null,
    Object? onTap = freezed,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as Future<void> Function()?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SsExternalModelImplCopyWith<$Res>
    implements $SsExternalModelCopyWith<$Res> {
  factory _$$SsExternalModelImplCopyWith(_$SsExternalModelImpl value,
          $Res Function(_$SsExternalModelImpl) then) =
      __$$SsExternalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String platform,
      String key,
      @FunctionConverter() Future<void> Function()? onTap});
}

/// @nodoc
class __$$SsExternalModelImplCopyWithImpl<$Res>
    extends _$SsExternalModelCopyWithImpl<$Res, _$SsExternalModelImpl>
    implements _$$SsExternalModelImplCopyWith<$Res> {
  __$$SsExternalModelImplCopyWithImpl(
      _$SsExternalModelImpl _value, $Res Function(_$SsExternalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? key = null,
    Object? onTap = freezed,
  }) {
    return _then(_$SsExternalModelImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as Future<void> Function()?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SsExternalModelImpl implements _SsExternalModel {
  _$SsExternalModelImpl(
      {required this.platform,
      required this.key,
      @FunctionConverter() this.onTap});

  factory _$SsExternalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SsExternalModelImplFromJson(json);

  @override
  final String platform;
  @override
  final String key;
  @override
  @FunctionConverter()
  final Future<void> Function()? onTap;

  @override
  String toString() {
    return 'SsExternalModel(platform: $platform, key: $key, onTap: $onTap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SsExternalModelImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, platform, key, onTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SsExternalModelImplCopyWith<_$SsExternalModelImpl> get copyWith =>
      __$$SsExternalModelImplCopyWithImpl<_$SsExternalModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SsExternalModelImplToJson(
      this,
    );
  }
}

abstract class _SsExternalModel implements SsExternalModel {
  factory _SsExternalModel(
          {required final String platform,
          required final String key,
          @FunctionConverter() final Future<void> Function()? onTap}) =
      _$SsExternalModelImpl;

  factory _SsExternalModel.fromJson(Map<String, dynamic> json) =
      _$SsExternalModelImpl.fromJson;

  @override
  String get platform;
  @override
  String get key;
  @override
  @FunctionConverter()
  Future<void> Function()? get onTap;
  @override
  @JsonKey(ignore: true)
  _$$SsExternalModelImplCopyWith<_$SsExternalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
