// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      uid: json['uid'] as String? ?? '',
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.normal,
      name: json['name'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
      cardImage: json['cardImage'] as String? ?? '',
      email: json['email'] as String? ?? '',
      team: json['team'] as String? ?? '',
      company: json['company'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      fax: json['fax'] as String? ?? '',
      lastUpdate: json['lastUpdate'] as String? ?? '',
      followings: (json['followings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      external: (json['external'] as List<dynamic>?)
              ?.map((e) => SsExternalModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'cardImage': instance.cardImage,
      'email': instance.email,
      'team': instance.team,
      'company': instance.company,
      'phone': instance.phone,
      'fax': instance.fax,
      'lastUpdate': instance.lastUpdate,
      'followings': instance.followings,
      'favorites': instance.favorites,
      'external': instance.external,
    };

const _$UserTypeEnumMap = {
  UserType.normal: 'normal',
  UserType.premium: 'premium',
  UserType.master: 'master',
};
