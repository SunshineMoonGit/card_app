import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:card_app/config/ui/theme/app_color.dart';

part 'app_bar_theme.dart';
part 'app_color.dart';
part 'app_color_scheme.dart';
part 'text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _AppColorScheme._lightColorScheme,
    textTheme: _TextTheme._textLightTheme,
    fontFamily: 'Pretendard',
    appBarTheme: _AppBarTheme._appBarLightTheme,
    scaffoldBackgroundColor: _AppColorScheme._lightColorScheme.background,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _AppColorScheme._darkColorScheme,
    textTheme: _TextTheme._textDarkTheme,
    fontFamily: 'Pretendard',
    appBarTheme: _AppBarTheme._appBarDarkTheme,
    scaffoldBackgroundColor: _AppColorScheme._lightColorScheme.background,
  );
}
