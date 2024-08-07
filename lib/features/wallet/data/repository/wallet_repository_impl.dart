import 'package:card_app/config/mapper/user_info_mapper.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/data/model/following_model.dart';
import 'package:card_app/features/wallet/data/source/local/wallet_data_source_local.dart';
import 'package:card_app/features/wallet/data/source/network/wallet_data_source_network.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalletRepositoryImpl extends WalletRepository {
  final WalletDataSourceLocal localDataSource;
  final WalletDataSourceNetwork networkDataSource;

  WalletRepositoryImpl({
    required this.localDataSource,
    required this.networkDataSource,
  });
  @override
  Future<Result<String>> addNetwork(String uid, FollowingEntity<UserInfoEntity> newData) async {
    Result<String> result = await networkDataSource.add(uid, FollowingModel.fromUserInfoEntity(newData));

    return result.when(
      success: (value) => Result.success(value),
      failure: (message) => Result.failure(message),
    );
  }

  @override
  Future<Result<List<FollowingEntity<UserInfoEntity>>>> getNetwork(
      String uid, List<FollowingEntity<String>> followings) async {
    Result<List<FollowingModel<UserInfoModel>>> result = await networkDataSource.get(
      uid,
      followings.map((e) => FollowingModel<String>.fromEntity(e)).toList(),
    );

    return result.when(
      success: (value) => Result.success(value.map((e) => e.toUserInfoEntity()).toList()),
      failure: (message) => Result.failure(message),
    );
  }

  @override
  Future<Result<List<FollowingEntity<UserInfoEntity>>>> getLocal(List<FollowingEntity<String>> uids) async {
    Result<List<FollowingModel<UserInfoModel>>> localData =
        await localDataSource.getLocal(uids.map((e) => FollowingModel.fromEntity(e)).toList());

    return localData.when(
      success: (value) {
        return Result.success(value.map((e) => e.toEntity() as FollowingEntity<UserInfoEntity>).toList());
      },
      failure: (message) {
        return Result.failure(message);
      },
    );
  }
  // Future<Result<List<UserInfoEntity>>> getLocal(List<String> uidFollowings) async {
  //   final Result<List<UserInfoModel>> result = await localDataSource.getLocal(uidFollowings);

  //   return result.when(
  //     success: (value) => Result.success(value.map((e) => e.toEntity()).toList()),
  //     failure: (message) => Result.failure(message),
  //   );
  // }

  @override
  Future<Result> addLocal(UserInfoEntity newData) async {
    return await localDataSource.addLocal(UserInfoMapper.fromEntity(newData));
  }

  @override
  Future<Result<List<UserInfoEntity>>> deleteLocal(String uid, List<UserInfoEntity> data) async {
    Result<List<UserInfoModel>> result =
        await localDataSource.deleteLocal(uid, data.map((e) => UserInfoMapper.fromEntity(e)).toList());

    return result.when(
      success: (value) => Result.success(value.map((e) => UserInfoMapper.toEntity(e)).toList()),
      failure: (message) => Result.failure(message),
    );
  }
}
