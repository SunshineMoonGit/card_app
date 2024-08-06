import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/mapper/user_info_mapper.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/data/source/auth/local/auth_data_source_local.dart';
import 'package:card_app/features/auth/data/source/auth/network/auth_data_source_network.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/shared/class/result_model/result.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSourceLocal dataSourceLocal;
  final AuthDataSourceNetwork dataSourceNetwork;

  AuthRepositoryImpl({
    required this.dataSourceLocal,
    required this.dataSourceNetwork,
  });
  @override
  Future<Result<UserInfoEntity>> signUpWithEmail(String email, String pw, KeySettingEntity settings) async {
    final Result<UserInfoModel> result =
        await dataSourceNetwork.signUpWithEmail(email, pw, KeySettingModel.fromEntity(settings));

    return result.when(
      success: (value) => Result.success(value.toEntity()),
      failure: (message) => Result.failure(message),
    );
  }

  @override
  Future<Result<UserInfoEntity>> signInWithEmail(String email, String pw, KeySettingEntity settings) async {
    final Result<UserInfoModel> result =
        await dataSourceNetwork.signInWithEmail(email, pw, KeySettingModel.fromEntity(settings));

    return result.when(
      success: (value) => Result.success(value.toEntity()),
      failure: (message) => Result.failure(message),
    );
  }

  // @override
  // Future<AuthState> check() async {
  //   return dataSourceLocal.check();
  // }

  @override
  Future<Result<UserInfoEntity>> getData(String uid) async {
    Result<UserInfoModel> result = await dataSourceNetwork.getData(uid);

    return result.when(
      success: (value) => Result.success(value.toEntity()),
      failure: (message) => Result.failure(message),
    );
  }

  @override
  Future<List<UserInfoEntity>> getDataList(List<String> uids) async {
    List<UserInfoModel> result = await dataSourceLocal.getDataList(uids);

    return result.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateBasicData(String uid, UserInfoEntity data) {
    return dataSourceNetwork.updateBasicData(uid, UserInfoMapper.toModel(data));
  }
}
