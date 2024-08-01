import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';

class GetWalletNetWorkUseCase {
  final WalletRepository repository;

  GetWalletNetWorkUseCase({required this.repository});

  Future<List<UserInfoEntity>> call(List<int>? following) async {
    return await repository.getWalletNetWork(following);
  }
}
