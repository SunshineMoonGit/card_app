import 'dart:convert';

import 'package:card_app/config/app/app_path.dart';
import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/data/source/auth/local/auth_data_source_local.dart';
import 'package:card_app/shared/functions/hive/ss_hive_auth.dart';
import 'package:flutter/services.dart';

class AuthDataSourceLocalImpl extends AuthDataSourceLocal {
  @override
  Future<AuthState> check() async {
    // UserInfoModel authInfo = SsHiveAuth.get();

    return AuthState.logIn;
  }

  @override
  Future<UserInfoModel> getData(uid) async {
    // hive에 데이터가 있다면 hive
    // 없으면...
    UserInfoModel result = SsHiveAuth.get();

    // Map<String, dynamic> hiveData = hiveDataDynamic.map((key, value) {
    //   return MapEntry(key.toString(), value);
    // });
    // UserInfoModel result = UserInfoModel.fromJson(hiveData);

    return result;
  }

  @override
  Future<List<UserInfoModel>> getDataList(List<String> uids) async {
    List<UserInfoModel> result = [];

    for (String uid in uids) {
      final UserInfoModel temp = await _get('user/$uid');

      result.add(temp);
    }

    return result;
  }

  @override
  Future<void> updateData(String uid, UserInfoModel data) async {
    SsHiveAuth.add(data);
  }

  Future<UserInfoModel> _get(String uid) async {
    final String jsonString = await rootBundle.loadString('${AppPath.localMy}$uid.json');

    final Map<String, dynamic> decodeJson = await json.decode(jsonString);

    final UserInfoModel result = UserInfoModel.fromJson(decodeJson);

    return result;
  }
}
