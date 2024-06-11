import 'dart:convert';

import 'package:card_app/config/const/app_const.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/wallet/domain/model/wallet_item_model.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter/services.dart';

abstract class WalletDataSource {
  Future getWallets(List<int>? following) async {}
  Future getWalletById(int id) async {}
}

//! 지금은 로컬 데이터에서 가져오지만, firebase로 바꿔야함
class WalletFirebase extends WalletDataSource {
  @override
  Future<List<UserInfoModel>> getWallets(List<int>? following) async {
    List<UserInfoModel> result = [];

    if (following != null) {
      for (int id in following) {
        result.add(await getWalletById(id));
      }

      return result.toSet().toList();
    } else {
      return [];
    }
  }

  @override
  Future<UserInfoModel> getWalletById(int id) async {
    final String jsonString = await rootBundle.loadString('${AppConst.localDummyPath}$id.json');

    final UserInfoModel userInfo = UserInfoModel.fromJson(await json.decode(jsonString));

    return userInfo;
  }
}
