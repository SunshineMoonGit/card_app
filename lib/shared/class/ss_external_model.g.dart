// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ss_external_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SsExternalModelImpl _$$SsExternalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SsExternalModelImpl(
      platform: json['platform'] as String,
      key: json['key'] as String,
      onTap: const FunctionConverter().fromJson(json['onTap'] as String?),
    );

Map<String, dynamic> _$$SsExternalModelImplToJson(
        _$SsExternalModelImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'key': instance.key,
      'onTap': const FunctionConverter().toJson(instance.onTap),
    };
