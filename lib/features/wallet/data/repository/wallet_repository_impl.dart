import 'package:card_app/config/mapper/user_info_mapper.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/data/data_source/local/wallet_data_source_local.dart';
import 'package:card_app/features/wallet/data/data_source/network/wallet_data_source_network.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/shared/class/result/result.dart';

class WalletRepositoryImpl extends WalletRepository {
  final WalletDataSourceLocal localDataSource;
  final WalletDataSourceNetwork networkDataSource;

  WalletRepositoryImpl({
    required this.localDataSource,
    required this.networkDataSource,
  });

  @override
  Future<List<UserInfoEntity>> getWalletNetWork(List<int>? following) async {
    return await networkDataSource.getWalletNetwork(following);
  }

  @override
  Future<Result<List<UserInfoEntity>>> getLocal(List<String> uidFollowings) async {
    final Result<List<UserInfoModel>> result = await localDataSource.getLocal(uidFollowings);

    return result.when(
      success: (value) => Result.success(value.map((e) => e.toEntity()).toList()),
      failure: (message) => Result.failure(message),
    );
  }

  @override
  Future<Result> addLocal(UserInfoEntity newData) async {
    return await localDataSource.addLocal(UserInfoMapper.toModel(newData));
  }

  @override
  Future<Result<List<UserInfoEntity>>> deleteLocal(String uid, List<UserInfoEntity> data) async {
    Result<List<UserInfoModel>> result =
        await localDataSource.deleteLocal(uid, data.map((e) => UserInfoMapper.toModel(e)).toList());

    return result.when(
      success: (value) => Result.success(value.map((e) => UserInfoMapper.toEntity(e)).toList()),
      failure: (message) => Result.failure(message),
    );
  }
}
