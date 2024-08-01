import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/shared/class/result/result.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmail(String email, String pw, SettingsModel settings);
  Future<void> signInWithEmail(String email, String pw, SettingsModel settings);
  Future<AuthState> check();

  Future<Result<UserInfoEntity>> getData(String uid);
  Future<List<UserInfoEntity>> getDataList(List<String> uids);

  Future<void> updateBasicData(String uid, UserInfoEntity data);

  // // local
  // Future<void> updateFollowing(String uid, UserInfoModel data);
}
