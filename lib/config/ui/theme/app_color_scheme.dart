part of 'app_theme.dart';

@immutable
class _AppColorScheme {
  // 라이트 모드 색상 구성표
  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _AppColor.primaryColor,
    onPrimaryContainer: _AppColor.hightLightPrimaryColor,
    onPrimary: _AppColor.light_0,
    secondary: _AppColor.light_2,
    onSecondary: _AppColor.light_9,
    background: _AppColor.light_1,
    onBackground: _AppColor.light_10,
    surface: _AppColor.light_0,
    onSurface: _AppColor.light_11,
    tertiary: _AppColor.light_4,
    onTertiary: _AppColor.light_7,
    //
    error: _AppColor.light_8,
    onError: _AppColor.light_0,
    shadow: _AppColor.light_4,
  );

// 다크 모드 색상 구성표
  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _AppColor.primaryColor,
    onPrimaryContainer: _AppColor.hightLightPrimaryColor,
    onPrimary: _AppColor.light_0,
    secondary: _AppColor.light_8,
    onSecondary: _AppColor.light_3,
    background: _AppColor.light_10,
    onBackground: _AppColor.light_1,
    surface: _AppColor.light_11,
    onSurface: _AppColor.light_0,
    tertiary: _AppColor.light_7,
    onTertiary: _AppColor.light_4,
    //
    error: _AppColor.light_6,
    onError: _AppColor.light_0,
    shadow: _AppColor.light_9,
  );
  // static const _lightColorScheme = ColorScheme(
  //   brightness: Brightness.light,
  //   primary: _AppColor.primaryColor,
  //   onPrimary: _AppColor.onPrimary,
  //   secondary: _AppColor.secondaryColor,
  //   onSecondary: _AppColor.onSecondary,
  //   background: _AppColor.background,
  //   onBackground: _AppColor.onBackground,
  //   surface: _AppColor.surface,
  //   onSurface: _AppColor.onSurface,
  //   error: _AppColor.error,
  //   onError: _AppColor.onError,
  //   tertiary: _AppColor.secondaryColor, // Optional if you have a tertiary color
  //   onTertiary: _AppColor.onSecondary, // Optional if you have a tertiary color
  //   shadow: _AppColor.secondaryColor,
  // );

  // static const _darkColorScheme = ColorScheme(
  //   brightness: Brightness.dark,
  //   primary: _AppColor.primaryColorDark,
  //   onPrimary: _AppColor.onPrimaryDark,
  //   secondary: _AppColor.secondaryColorDark,
  //   onSecondary: _AppColor.onSecondaryDark,
  //   background: _AppColor.backgroundDark,
  //   onBackground: _AppColor.onBackgroundDark,
  //   surface: _AppColor.surfaceDark,
  //   onSurface: _AppColor.onSurfaceDark,
  //   error: _AppColor.errorDark,
  //   onError: _AppColor.onErrorDark,
  //   tertiary: _AppColor.secondaryColorDark, // Optional if you have a tertiary color
  //   onTertiary: _AppColor.onSecondaryDark, // Optional if you have a tertiary color
  //   shadow: _AppColor.onBackgroundDark,
  // );
}
