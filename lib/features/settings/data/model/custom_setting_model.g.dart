// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomSettingModelImpl _$$CustomSettingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomSettingModelImpl(
      darkMode: json['darkMode'] as bool,
      language: json['language'] as String?,
      notificationsEnabled: json['notificationsEnabled'] as bool,
    );

Map<String, dynamic> _$$CustomSettingModelImplToJson(
        _$CustomSettingModelImpl instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'language': instance.language,
      'notificationsEnabled': instance.notificationsEnabled,
    };
