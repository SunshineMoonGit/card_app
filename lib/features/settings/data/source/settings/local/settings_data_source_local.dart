import 'package:card_app/features/settings/data/model/custom_setting_model.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';

abstract class SettingsDataSourceLocal {
  Future<CustomSettingModel> customInit(String language);
  Future<void> customUpdate(CustomSettingModel newData);

  Future<KeySettingModel> keyInit();
  Future<void> keyUpdate(KeySettingModel newData);
}
