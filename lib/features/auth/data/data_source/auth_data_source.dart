import 'dart:convert';

import 'package:card_app/config/const/app_const.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:flutter/services.dart';

abstract class AuthDataSource {
  Future<UserInfoModel> getMyData();
}

class AuthFirebase extends AuthDataSource {
  @override
  Future<UserInfoModel> getMyData() async {
    // My Data Read
    final String jsonString = await rootBundle.loadString(AppConst.localMyPath);

    final Map<String, dynamic> decodeJson = await json.decode(jsonString);

    final UserInfoModel result = UserInfoModel.fromJson(decodeJson);

    return result;
  }
}
