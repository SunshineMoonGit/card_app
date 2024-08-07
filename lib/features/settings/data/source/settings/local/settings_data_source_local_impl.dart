import 'package:card_app/features/settings/data/model/custom_setting_model.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/features/settings/data/source/settings/local/settings_data_source_local.dart';
import 'package:card_app/shared/functions/hive/ss_hive.dart';

class SettingsDataSourceLocalImpl extends SettingsDataSourceLocal {
  @override
  Future<CustomSettingModel> customInit(String language) async {
    try {
      final CustomSettingModel data = await SsHive.setting.custom.get();
      return data;
    } catch (e) {
      final CustomSettingModel data = CustomSettingModel.init(language);
      await SsHive.setting.custom.set(data);
      return data;
    }
  }

  @override
  Future<void> customUpdate(CustomSettingModel newData) async {
    await SsHive.setting.custom.update(newData);
  }

  @override
  Future<KeySettingModel> keyInit() async {
    try {
      final KeySettingModel data = await SsHive.setting.key.get();

      return data;
    } catch (e) {
      final KeySettingModel data = KeySettingModel.init();
      await SsHive.setting.key.set(data);
      return data;
    }
  }

  @override
  Future<void> keyUpdate(KeySettingModel newData) async {
    await SsHive.setting.key.update(newData);
  }
}
