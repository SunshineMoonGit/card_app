import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/shared/class/result_model/result.dart';

class WalletLocalUseCase {
  final WalletRepository repository;

  WalletLocalUseCase({required this.repository});

  Future<Result<List<UserInfoEntity>>> get(List<String> uidFollowings) async {
    return await repository.getLocal(uidFollowings);
  }

  Future<Result> addLocal(UserInfoEntity newData) async {
    return await repository.addLocal(newData);
  }

  Future<Result<List<UserInfoEntity>>> deleteLocal(String uid, List<UserInfoEntity> data) async {
    return await repository.deleteLocal(uid, data);
  }
}
