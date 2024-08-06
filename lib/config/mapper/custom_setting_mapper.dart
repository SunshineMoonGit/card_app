import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/settings/data/model/custom_setting_model.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';

class CustomSettingMapper {
  static CustomSettingEntity toEntity(CustomSettingModel model) {
    return CustomSettingEntity(
      darkMode: model.darkMode,
      notificationsEnabled: model.notificationsEnabled,
      language: model.language,
    );
  }

  static CustomSettingModel toModel(CustomSettingEntity entity) {
    return CustomSettingModel(
      darkMode: entity.darkMode,
      notificationsEnabled: entity.notificationsEnabled,
      language: entity.language,
    );
  }
}
