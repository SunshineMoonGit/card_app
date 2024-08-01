import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/data/data_source/network/wallet_data_source_network.dart';

class WalletDataSourceNetworkImpl extends WalletDataSourceNetwork {
  @override
  Future<List<UserInfoEntity>> getWalletNetwork(List<int>? following) async {
    List<UserInfoEntity> result = [];

    if (following != null) {
      for (int id in following) {
        result.add(await getWalletByIdNetwork(id));
      }

      return result.toSet().toList();
    } else {
      return [];
    }
  }

  @override
  Future<UserInfoEntity> getWalletByIdNetwork(int id) async {
    // final String jsonString = await rootBundle.loadString('${AppPath.localDummy}$id.json');

    // final UserInfoModel userInfo = UserInfoModel.fromJson(await json.decode(jsonString));

    // return userInfo;
    return UserInfoEntity();
  }
}
