import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/shared/class/result/result.dart';

abstract class WalletRepository {
  // 유저 정보 리스트 가져오기 - network
  Future<List<UserInfoEntity>> getWalletNetWork(List<int>? following);
  // 유저 정보 리스트 가져오기 - local db
  Future<Result<List<UserInfoEntity>>> getLocal(List<String> uidFollowings);

  Future<Result> addLocal(UserInfoEntity newData);
  Future<Result<List<UserInfoEntity>>> deleteLocal(String uid, List<UserInfoEntity> data);
}
