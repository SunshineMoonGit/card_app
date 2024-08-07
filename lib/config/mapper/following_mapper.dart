import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/data/model/following_model.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';

class FollowingMapper {
  static FollowingModel<T> fromEntity<T>(FollowingEntity<T> entity) {
    return FollowingModel<T>(
      user: entity.user,
      favorite: entity.favorite,
      linked: entity.linked,
    );
  }

  static FollowingEntity<T> toEntity<T>(FollowingModel<T> model) {
    return FollowingEntity<T>(
      user: model.user,
      favorite: model.favorite,
      linked: model.linked,
    );
  }

  static FollowingModel<UserInfoModel> fromUserInfoEntity(FollowingEntity<UserInfoEntity> entity) {
    return FollowingModel<UserInfoModel>(
      user: UserInfoModel.fromEntity(entity.user),
      favorite: entity.favorite,
      linked: entity.linked,
    );
  }

  static FollowingEntity<UserInfoEntity> toUserInfoEntity(FollowingModel<UserInfoModel> model) {
    return FollowingEntity<UserInfoEntity>(
      user: model.user.toEntity(),
      favorite: model.favorite,
      linked: model.linked,
    );
  }
}
