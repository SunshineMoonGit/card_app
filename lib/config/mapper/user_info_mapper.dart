import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';

class UserInfoMapper {
  static UserInfoEntity toEntity(UserInfoModel model) {
    return UserInfoEntity(
      uid: model.uid,
      userType: model.userType,
      name: model.name,
      profileImage: model.profileImage,
      cardImage: model.cardImage,
      email: model.email,
      team: model.team,
      company: model.company,
      phone: model.phone,
      fax: model.fax,
      lastUpdate: model.lastUpdate,
      followings: model.followings,
      favorites: model.favorites,
      external: model.external,
    );
  }

  static UserInfoModel toModel(UserInfoEntity entity) {
    return UserInfoModel(
      uid: entity.uid,
      userType: entity.userType,
      name: entity.name,
      profileImage: entity.profileImage,
      cardImage: entity.cardImage,
      email: entity.email,
      team: entity.team,
      company: entity.company,
      phone: entity.phone,
      fax: entity.fax,
      lastUpdate: entity.lastUpdate,
      followings: entity.followings,
      favorites: entity.favorites,
      external: entity.external,
    );
  }
}
