import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/wallet/domain/model/wallet_item_model.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';

class GetWalletUseCase {
  final WalletRepository repository;

  GetWalletUseCase({required this.repository});

  Future<List<UserInfoModel>> call(List<int>? following) async {
    return await repository.getWallet(following);
  }
}
