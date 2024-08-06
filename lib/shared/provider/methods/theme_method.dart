import 'package:card_app/features/settings/presentation/provider/setting_language_temp_provider.dart';
import 'package:card_app/features/settings/presentation/provider/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeMethod {
  final WidgetRef ref;

  ThemeMethod(this.ref);

  void changeTheme() {
    ref.read(themeProvider.notifier).toggle();
  }

  void changeLanguageTemp(String language) {
    ref.read(settingLanguageTempProvider.notifier).change(language);
  }
}
