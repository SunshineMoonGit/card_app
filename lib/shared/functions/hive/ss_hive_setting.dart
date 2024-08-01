import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:hive/hive.dart';

class SsHiveSetting {
  static Future<void> update(SettingsModel settingData) async {
    Hive.box(AppString.setting).put("data", settingData.toJson());
  }

  static void delete() {
    Hive.box(AppString.setting).delete("data");
  }

  static Future<SettingsModel> get() async {
    Map<dynamic, dynamic> hiveDataDynamic = await Hive.box(AppString.setting).get("data");

    Map<String, dynamic> hiveData = hiveDataDynamic.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    return SettingsModel.fromJson(hiveData);
  }
}
