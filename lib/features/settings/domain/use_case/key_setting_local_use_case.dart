import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/ss_print.dart';

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
