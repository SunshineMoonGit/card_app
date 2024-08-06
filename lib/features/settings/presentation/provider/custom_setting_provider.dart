import 'package:card_app/di/injector.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/use_case/custom_setting_local_use_case.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customSettingProvider = StateNotifierProvider<CustomSettingProviderNotifier, CustomSettingEntity>((ref) {
  return CustomSettingProviderNotifier();
});

class CustomSettingProviderNotifier extends StateNotifier<CustomSettingEntity> {
  final CustomSettingLocalUseCase settingsLocalUseCase = injector.get<CustomSettingLocalUseCase>();

  CustomSettingProviderNotifier() : super(CustomSettingEntity.init());

  Future<void> init(String language) async {
    state = await settingsLocalUseCase.init(language);
  }

  Future<void> update(CustomSettingEntity newData) async {
    await settingsLocalUseCase.update(newData);

    state = newData;
  }

  Future<void> clear() async {
    final CustomSettingEntity newData = CustomSettingEntity.init();
    await update(newData);

    state = newData;
  }
}
