import 'package:card_app/config/app/app_path.dart';
import 'package:card_app/features/settings/data/model/custom_setting_model.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:hive/hive.dart';

class HiveSetting {
  final HiveCustomSetting custom = HiveCustomSetting();
  final HiveKeySetting key = HiveKeySetting();
}

class HiveCustomSetting {
  Future<void> update(CustomSettingModel settingData) async {
    Hive.box(AppPath.setting).put(AppPath.localCustom, settingData.toJson());
  }

  void delete() {
    Hive.box(AppPath.setting).delete(AppPath.localCustom);
  }

  Future<CustomSettingModel> get() async {
    Map<dynamic, dynamic> hiveDataDynamic = await Hive.box(AppPath.setting).get(AppPath.localCustom);

    Map<String, dynamic> hiveData = hiveDataDynamic.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    return CustomSettingModel.fromJson(hiveData);
  }

  Future<void> set(CustomSettingModel data) async {
    await Hive.box(AppPath.setting).put(AppPath.localCustom, data.toJson());
  }
}

class HiveKeySetting {
  Future<void> update(KeySettingModel settingData) async {
    Hive.box(AppPath.setting).put(AppPath.localKey, settingData.toJson());
  }

  void customDelete() {
    Hive.box(AppPath.setting).delete(AppPath.localKey);
  }

  Future<KeySettingModel> get() async {
    Map<dynamic, dynamic> hiveDataDynamic = await Hive.box(AppPath.setting).get(AppPath.localKey);

    Map<String, dynamic> hiveData = hiveDataDynamic.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    return KeySettingModel.fromJson(hiveData);
  }

  Future<void> set(KeySettingModel data) async {
    await Hive.box(AppPath.setting).put(AppPath.localKey, data.toJson());
  }
}
