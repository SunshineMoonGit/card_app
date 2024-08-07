import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/wallet/data/model/following_model.dart';
import 'package:card_app/shared/class/result_model/result.dart';

abstract class WalletDataSourceNetwork {
  // Future getWalletNetwork(List<int>? following) async {}
  // Future getWalletByIdNetwork(int id) async {}

  Future<Result<List<FollowingModel<UserInfoModel>>>> get(String uid, List<FollowingModel<String>> followings);

  Future<Result<String>> add(String uid, FollowingModel<UserInfoModel> newData);
}
