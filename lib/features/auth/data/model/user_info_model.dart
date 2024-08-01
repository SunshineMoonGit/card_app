import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/mapper/user_info_mapper.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/class/ss_external_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
abstract class UserInfoModel with _$UserInfoModel {
  const UserInfoModel._();
  factory UserInfoModel({
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
    @Default([]) List<String> followings,
    @Default([]) List<String> favorites,
    @Default([]) List<SsExternalModel> external,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);

  factory UserInfoModel.fromEntity(UserInfoEntity entity) => UserInfoMapper.toModel(entity);

  UserInfoEntity toEntity() => UserInfoMapper.toEntity(this);
}

// 추가 메서드 정의
extension UserInfoModelX on UserInfoModel {
  UserInfoModel premiumChange(UserType userType) {
    return copyWith(userType: userType);
  }

  UserInfoModel typeCopyWith({
    required String type,
    required String value,
  }) {
    switch (type) {
      case AppString.name:
        return copyWith(name: value);
      case AppString.email:
        return copyWith(email: value);
      case AppString.team:
        return copyWith(team: value);
      case AppString.company:
        return copyWith(company: value);
      case AppString.phone:
        return copyWith(phone: value);
      case AppString.fax:
        return copyWith(fax: value);
      default:
        return this;
    }
  }

  UserInfoModel update({required UserInfoModel updateData}) {
    return copyWith(
      name: updateData.name,
      profileImage: updateData.profileImage,
      cardImage: updateData.cardImage,
      email: updateData.email,
      team: updateData.team,
      company: updateData.company,
      phone: updateData.phone,
      fax: updateData.fax,
      followings: updateData.followings,
      favorites: updateData.favorites,
      external: updateData.external,
      lastUpdate: updateData.lastUpdate,
    );
  }
}
