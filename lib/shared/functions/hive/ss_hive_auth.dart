import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:hive/hive.dart';

class SsHiveAuth {
  static void add(UserInfoModel newData) {
    Hive.box(AppString.auth).add(newData.toJson());
  }

  static UserInfoModel get() {
    Map<dynamic, dynamic> hiveDataDynamic = Hive.box(AppString.auth).get("data");

    Map<String, dynamic> hiveData = hiveDataDynamic.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    return UserInfoModel.fromJson(hiveData);
  }
}
