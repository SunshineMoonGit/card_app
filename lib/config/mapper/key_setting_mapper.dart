import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';

class KeySettingMapper {
  static KeySettingEntity toEntity(KeySettingModel model) {
    return KeySettingEntity(
      uid: model.uid,
      favorites: model.favorites,
      recent: model.recent,
      updateTime: model.updateTime,
    );
  }

  static KeySettingModel toModel(KeySettingEntity entity) {
    return KeySettingModel(
      uid: entity.uid,
      favorites: entity.favorites,
      recent: entity.recent,
      updateTime: entity.updateTime,
    );
  }
}
