// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_setting_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomSettingEntityImpl _$$CustomSettingEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomSettingEntityImpl(
      darkMode: json['darkMode'] as bool? ?? false,
      language: json['language'] as String?,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      recent: (json['recent'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CustomSettingEntityImplToJson(
        _$CustomSettingEntityImpl instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'language': instance.language,
      'notificationsEnabled': instance.notificationsEnabled,
      'recent': instance.recent,
    };
