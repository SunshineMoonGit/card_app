import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/shared/class/result/result.dart';

abstract class AuthDataSourceNetwork {
  Future<void> signUpWithEmail(String email, String pw, SettingsModel settings);
  Future<void> signInWithEmail(String email, String pw, SettingsModel settings);

  Future<void> updateBasicData(String uid, UserInfoModel data);
  Future<Result<UserInfoModel>> getData(String uid);
}
