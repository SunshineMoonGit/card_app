import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/ss_print.dart';

class CustomSettingLocalUseCase {
  final SettingsRepository repository;

  CustomSettingLocalUseCase({required this.repository});

  Future<CustomSettingEntity> init(String language) async {
    return await repository.customInit(language);
  }

  Future<void> update(CustomSettingEntity newData) async {
    await repository.customUpdate(newData);
  }
}
