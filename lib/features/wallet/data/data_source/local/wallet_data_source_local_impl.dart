import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/wallet/data/data_source/local/wallet_data_source_local.dart';
import 'package:card_app/shared/class/result/result.dart';
import 'package:card_app/shared/functions/hive/ss_hive_following.dart';

class WalletDataSourceLocalImpl extends WalletDataSourceLocal {
  @override
  Future<Result<List<UserInfoModel>>> getLocal(List<String> uidFollowings) async {
    if (uidFollowings.isEmpty) {
      return const Result.success([]);
    }

    try {
      List<UserInfoModel> data = await SsHiveWallet.get(uidFollowings);

      return Result.success(data);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> addLocal(UserInfoModel newData) async {
    try {
      // 로컬에 저장
      await SsHiveWallet.add(newData);
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

      await SsHiveWallet.delete(uid);

      return Result.success(updatedFollowings);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
