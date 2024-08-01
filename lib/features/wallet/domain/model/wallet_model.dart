import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';

@freezed
class WalletModel with _$WalletModel {
  factory WalletModel({
    @Default([]) List<UserInfoEntity> recent,
    @Default([]) List<UserInfoEntity> favorites,
    @Default([]) List<UserInfoEntity> followings,
  }) = _WalletModel;

  // factory WalletModel.init() {
  //   return WalletModel(
  //     recent: [],
  //     favorites: [],
  //     followings: [],
  //   );
  // }
}
