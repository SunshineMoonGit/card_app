import 'package:card_app/config/mapper/following_mapper.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_model.freezed.dart';
part 'following_model.g.dart';

@Freezed(genericArgumentFactories: true)
class FollowingModel<T> with _$FollowingModel<T> {
  const FollowingModel._();

  factory FollowingModel({
    required T user,
    @Default(false) bool favorite,
    @Default(false) bool linked,
  }) = _FollowingModel<T>;

  factory FollowingModel.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$FollowingModelFromJson(json, fromJsonT);

  factory FollowingModel.fromEntity(FollowingEntity<T> entity) {
    return FollowingMapper.fromEntity<T>(entity);
  }

  static FollowingModel<UserInfoModel> fromUserInfoEntity(FollowingEntity<UserInfoEntity> entity) {
    return FollowingMapper.fromUserInfoEntity(entity);
  }
}

// 확장 메서드로 toEntity 정의
extension FollowingModelX<T> on FollowingModel<T> {
  FollowingEntity<T> toEntity() {
    return FollowingMapper.toEntity<T>(this);
  }
}

extension FollowingModelY on FollowingModel<UserInfoModel> {
  FollowingEntity<UserInfoEntity> toUserInfoEntity() {
    return FollowingMapper.toUserInfoEntity(this);
  }
}

// // String 타입을 사용하는 경우
// final jsonString = '{"user": "user123", "favorite": true}';
// final map = json.decode(jsonString);
// final stringFollowing = FollowingModel<String>.fromJson(map, (json) => json as String);

// // UserInfo 타입을 사용하는 경우 (UserInfo 클래스가 fromJson 메서드를 가지고 있다고 가정)
// final jsonUserInfo = '{"user": {"id": "123", "name": "John"}, "favorite": false}';
// final mapUserInfo = json.decode(jsonUserInfo);
// final userInfoFollowing = FollowingModel<UserInfo>.fromJson(
//   mapUserInfo, 
//   (json) => UserInfo.fromJson(json as Map<String, dynamic>)
// );
