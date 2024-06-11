// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      uid: (json['uid'] as num?)?.toInt(),
      name: json['name'] as String?,
      profileImage: json['profileImage'] as String?,
      cardImage: json['cardImage'] as String?,
      email: json['email'] as String?,
      team: json['team'] as String?,
      company: json['company'] as String?,
      phone: json['phone'] as String?,
      fax: json['fax'] as String?,
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'cardImage': instance.cardImage,
      'email': instance.email,
      'team': instance.team,
      'company': instance.company,
      'phone': instance.phone,
      'fax': instance.fax,
      'following': instance.following,
    };
