// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      uid: json['uid'] as String?,
      updateTime: json['updateTime'] as String,
      darkMode: json['darkMode'] as bool,
      language: json['language'] as String?,
      notificationsEnabled: json['notificationsEnabled'] as bool,
      favorites:
          (json['favorites'] as List<dynamic>).map((e) => e as String).toList(),
      recent:
          (json['recent'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'updateTime': instance.updateTime,
      'darkMode': instance.darkMode,
      'language': instance.language,
      'notificationsEnabled': instance.notificationsEnabled,
      'favorites': instance.favorites,
      'recent': instance.recent,
    };
