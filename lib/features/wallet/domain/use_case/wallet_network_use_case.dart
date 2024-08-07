import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/shared/class/result_model/result.dart';

class WalletNetworkUseCase {
  final WalletRepository repository;

  WalletNetworkUseCase({required this.repository});

  Future<Result<List<FollowingEntity<UserInfoEntity>>>> get(
      String uid, List<FollowingEntity<String>> followings) async {
    Result<List<FollowingEntity<UserInfoEntity>>> result = await repository.getNetwork(uid, followings);

    return result.when(
      success: (value) => Result.success(value),
      failure: (message) => Result.failure(message),
    );
  }

  Future<Result<String>> add(String uid, FollowingEntity<UserInfoEntity> newData) async {
    Result<String> result = await repository.addNetwork(uid, newData);

    return result.when(
      success: (value) => Result.success(value),
      failure: (message) => Result.failure(message),
    );
  }
}
