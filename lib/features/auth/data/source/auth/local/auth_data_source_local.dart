import 'package:card_app/features/auth/data/model/user_info_model.dart';

abstract class AuthDataSourceLocal {
  // Future<AuthState> check();

  Future<UserInfoModel> getData(String uid);
  Future<List<UserInfoModel>> getDataList(List<String> uids);

  Future<void> updateData(String uid, UserInfoModel data);
}
