import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/wallet/data/model/following_model.dart';
import 'package:card_app/shared/class/result_model/result.dart';

abstract class WalletDataSourceLocal {
  Future<Result<List<FollowingModel<UserInfoModel>>>> getLocal(List<FollowingModel<String>> uids);
  // Future<Result<List<UserInfoModel>>> getLocal(List<String> uidFollowings);
  Future<Result> addLocal(UserInfoModel newData);
  Future<Result<List<UserInfoModel>>> deleteLocal(String uid, List<UserInfoModel> data);
}
