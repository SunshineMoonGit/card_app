// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingModelImpl<T> _$$FollowingModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$FollowingModelImpl<T>(
      user: fromJsonT(json['user']),
      favorite: json['favorite'] as bool? ?? false,
      linked: json['linked'] as bool? ?? false,
    );

Map<String, dynamic> _$$FollowingModelImplToJson<T>(
  _$FollowingModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'user': toJsonT(instance.user),
      'favorite': instance.favorite,
      'linked': instance.linked,
    };
