import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/class/ss_external_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';

@freezed
abstract class UserInfoEntity with _$UserInfoEntity {
  const UserInfoEntity._();

  factory UserInfoEntity({
    @Default('') String uid,
    @Default(UserType.normal) UserType userType,
    @Default('') String name,
    @Default('') String profileImage,
    @Default('') String cardImage,
    @Default('') String email,
    @Default('') String team,
    @Default('') String company,
    @Default('') String phone,
    @Default('') String fax,
    @Default('') String lastUpdate,
    // ------ premium ------
    @Default([]) List<FollowingEntity<String>> followings,
    @Default([]) List<SsExternalModel> external,
  }) = _UserInfoEntity;

  // 프리미엄 사용자인지 확인하는 메서드
  bool get isPremium => userType == UserType.premium;

  // 팔로잉 추가 메서드
  UserInfoEntity addFollowing(String userId) {
    // userId를 가진 FollowingEntity가 이미 존재하는지 확인
    if (followings.any((following) => following.user == userId)) {
      return this;
    }

    // 새로운 FollowingEntity 생성 및 리스트에 추가
    final newFollowing = FollowingEntity<String>(user: userId);
    return copyWith(followings: [...followings, newFollowing]);
  }

  // 팔로잉 제거 메서드
  UserInfoEntity removeFollowing(String userId) {
    return copyWith(
      followings: followings.where((following) => following.user != userId).toList(),
    );
  }

  static UserInfoEntity fromController(NewCardController controller) {
    return UserInfoEntity(
      cardImage: controller.cardImageController,
      company: controller.companyController.text,
      email: controller.emailController.text,
      fax: controller.faxController.text,
      name: controller.nameController.text,
      phone: controller.phoneController.text,
      team: controller.teamController.text,
      userType: UserType.normal,
    );
  }
}
