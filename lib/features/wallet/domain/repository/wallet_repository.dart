import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/shared/class/result_model/result.dart';

abstract class WalletRepository {
  // network
  Future<Result<List<FollowingEntity<UserInfoEntity>>>> getNetwork(
      String uid, List<FollowingEntity<String>> followings);
  Future<Result<String>> addNetwork(String uid, FollowingEntity<UserInfoEntity> newData);

  // hive
  Future<Result<List<FollowingEntity<UserInfoEntity>>>> getLocal(List<FollowingEntity<String>> uids);

  Future<Result> addLocal(UserInfoEntity newData);
  Future<Result<List<UserInfoEntity>>> deleteLocal(String uid, List<UserInfoEntity> data);
}
