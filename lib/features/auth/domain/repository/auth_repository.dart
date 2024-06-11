import 'package:card_app/features/auth/domain/model/user_info_model.dart';

abstract class AuthRepository {
  Future<UserInfoModel> getMyData();
}
