import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/shared/class/result_model/result.dart';

abstract class AuthDataSourceNetwork {
  Future<Result<UserInfoModel>> signUpWithEmail(String email, String pw, KeySettingModel settings);
  Future<Result<UserInfoModel>> signInWithEmail(String email, String pw, KeySettingModel settings);

  Future<Result<UserInfoModel>> getData(String uid);

  Future<void> updateBasicData(String uid, UserInfoModel data);
}
