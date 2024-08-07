import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/shared/class/result_model/result.dart';

abstract class AuthRepository {
  Future<Result<UserInfoEntity>> signUpWithEmail(String email, String pw, KeySettingEntity settings);
  Future<void> signInWithEmail(String email, String pw, KeySettingEntity settings);
  // Future<AuthState> check();

  Future<Result<UserInfoEntity>> getData(String uid);
  Future<List<UserInfoEntity>> getDataList(List<String> uids);

  Future<void> updateBasicData(String uid, UserInfoEntity data);

  // // local
  // Future<void> updateFollowing(String uid, UserInfoModel data);
}
