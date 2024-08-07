import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';

class KeySettingLocalUseCase {
  final SettingsRepository repository;

  KeySettingLocalUseCase({required this.repository});

  Future<KeySettingEntity> init() async {
    return await repository.keyInit();
  }

  Future<void> update(KeySettingEntity newData) async {
    await repository.keyUpdate(newData);
  }
}
