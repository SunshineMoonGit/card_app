import 'package:card_app/features/settings/presentation/provider/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingLanguageTempProvider = StateNotifierProvider<SettingLanguageTempProviderNotifier, String>((ref) {
  final String settingLanguage = ref.watch(settingsProvider).language!;
  return SettingLanguageTempProviderNotifier(settingLanguage);
});

class SettingLanguageTempProviderNotifier extends StateNotifier<String> {
  final String settingLanguage;
  SettingLanguageTempProviderNotifier(this.settingLanguage) : super(settingLanguage);

  void init() {
    state = settingLanguage;
  }

  void change(String locale) {
    state = locale;
  }

  bool check(String language) {
    if (state == language) {
      return true;
    } else {
      return false;
    }
  }
}
