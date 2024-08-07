import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/shared/class/result_model/result.dart';

class WalletLocalUseCase {
  final WalletRepository repository;

  WalletLocalUseCase({required this.repository});

  Future<List<FollowingEntity<UserInfoEntity>>> get(List<FollowingEntity<String>> uids) async {
    if (uids.isEmpty) {
      return [];
    }

    Result<List<FollowingEntity<UserInfoEntity>>> result = await repository.getLocal(uids);

    return result.when(
      success: (value) => value,
      failure: (message) => [],
    );
  }

  Future<Result> add(UserInfoEntity newData) async {
    return await repository.addLocal(newData);
  }

  Future<Result<List<UserInfoEntity>>> delete(String uid, List<UserInfoEntity> data) async {
    return await repository.deleteLocal(uid, data);
  }
}
