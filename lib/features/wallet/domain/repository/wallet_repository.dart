import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/wallet/domain/model/wallet_item_model.dart';

abstract class WalletRepository {
  // 유저 정보 리스트 가져오기 - firebase
  Future<List<UserInfoModel>> getWallet(List<int>? following);

  // page 및 즐겨찾기 정보 가져오기 - local
}
