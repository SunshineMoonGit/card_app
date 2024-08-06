import 'dart:io';

import 'package:card_app/config/router/router.dart';
import 'package:card_app/config/ui/theme/app_theme.dart';
import 'package:card_app/features/settings/presentation/provider/custom_setting_provider.dart';
import 'package:card_app/features/settings/presentation/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:card_app/generated/l10n.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool lightMode = ref.watch(themeProvider);
    final String? language = ref.watch(customSettingProvider).language;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          localizationsDelegates: const [
            S.delegate, // Add this line!
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ko'),
          ],
          locale: language == null ? Locale(Platform.localeName.substring(0, 2)) : Locale(language),
          debugShowCheckedModeBanner: false,
          title: 'card app',
          theme: lightMode ? AppTheme.lightTheme : AppTheme.darkTheme,
          routerConfig: ref.watch(goRouterProvider),
        );
      },
    );
  }
}

// Locale stringToLocale(String value) {
//   if (value == 'en') {
//     return Locale(value);
//   }
// }
