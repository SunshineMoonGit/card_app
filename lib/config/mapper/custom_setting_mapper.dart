import 'package:card_app/features/settings/data/model/custom_setting_model.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';

class CustomSettingMapper {
  static CustomSettingModel fromEntity(CustomSettingEntity entity) {
    return CustomSettingModel(
      darkMode: entity.darkMode,
      notificationsEnabled: entity.notificationsEnabled,
      language: entity.language,
    );
  }

  static CustomSettingEntity toEntity(CustomSettingModel model) {
    return CustomSettingEntity(
      darkMode: model.darkMode,
      notificationsEnabled: model.notificationsEnabled,
      language: model.language,
    );
  }
}
