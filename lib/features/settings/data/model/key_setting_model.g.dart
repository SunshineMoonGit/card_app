// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeySettingModelImpl _$$KeySettingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KeySettingModelImpl(
      uid: json['uid'] as String?,
      updateTime: json['updateTime'] as String,
      favorites:
          (json['favorites'] as List<dynamic>).map((e) => e as String).toList(),
      recent:
          (json['recent'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$KeySettingModelImplToJson(
        _$KeySettingModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'updateTime': instance.updateTime,
      'favorites': instance.favorites,
      'recent': instance.recent,
    };
