import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';

abstract class SettingsRepository {
  Future<CustomSettingEntity> customInit(String language);
  Future<void> customUpdate(CustomSettingEntity newData);

  Future<KeySettingEntity> keyInit();
  Future<void> keyUpdate(KeySettingEntity newData);
}
