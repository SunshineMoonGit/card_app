import 'package:card_app/di/injector.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/features/settings/domain/use_case/get_settings_local_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = StateNotifierProvider<SettingsProviderNotifier, SettingsModel>((ref) {
  return SettingsProviderNotifier();
});

class SettingsProviderNotifier extends StateNotifier<SettingsModel> {
  final SettingsLocalUseCase settingsLocalUseCase = injector.get<SettingsLocalUseCase>();

  SettingsProviderNotifier() : super(SettingsModel.init());

  Future<void> init(String language) async {
    SettingsModel result = await settingsLocalUseCase.get(language);

    await update(result);
  }

  Future<void> update(SettingsModel newData) async {
    await settingsLocalUseCase.update(newData);

    state = newData;
  }
}
