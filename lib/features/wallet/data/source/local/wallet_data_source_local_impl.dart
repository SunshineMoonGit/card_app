import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/wallet/data/model/following_model.dart';
import 'package:card_app/features/wallet/data/source/local/wallet_data_source_local.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/hive/ss_hive.dart';

class WalletDataSourceLocalImpl extends WalletDataSourceLocal {
  @override
  Future<Result<List<FollowingModel<UserInfoModel>>>> getLocal(List<FollowingModel<String>> uids) async {
    try {
      final List<FollowingModel<UserInfoModel>> localData = await SsHive.wallet.get(uids);

      return Result.success(localData);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> addLocal(UserInfoModel newData) async {
    try {
      // 로컬에 저장
      await SsHive.wallet.add(newData);
      return const Result.success(true);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<UserInfoModel>>> deleteLocal(String uid, List<UserInfoModel> data) async {
    try {
      final int index = data.indexWhere((element) => element.uid == uid);

      final List<UserInfoModel> updatedFollowings = List.from(data)..removeAt(index);

      await SsHive.wallet.delete(uid);

      return Result.success(updatedFollowings);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
