part of 'app_theme.dart';

@immutable
class _AppColorScheme {
  static const _lightColorScheme = ColorScheme(
    // 밝기
    brightness: Brightness.light,
    // 기본 색상
    primary: _AppColor.primaryColor,
    // 기본 색상 위의 텍스트 색상
    onPrimary: _AppColor.white,
    // 강조 색상
    secondary: _AppColor.secondaryColor,
    // 강조 색상 위의 텍스트 색상
    onSecondary: _AppColor.white,
    // 세 번째 컨테이너 색상
    tertiaryContainer: _AppColor.accentColor,
    // 세 번째 컨테이너 위의 텍스트 색상
    onTertiaryContainer: _AppColor.black,
    // 오류 색상
    error: _AppColor.red,
    // 오류 색상 위의 텍스트 색상
    onError: _AppColor.white,
    // 배경 색상
    background: _AppColor.white,
    // 배경 위의 텍스트 색상
    onBackground: _AppColor.textColor,
    // 서페이스 색상
    surface: _AppColor.white,
    // 서페이스 위의 텍스트 색상
    onSurface: _AppColor.black,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _AppColor.primaryColor, // Primary color for Youtube
    onPrimary: _AppColor.black,
    secondary: _AppColor.white,
    onSecondary: _AppColor.black,
    tertiaryContainer: _AppColor.accentColorDark,
    onTertiaryContainer: _AppColor.white,
    error: _AppColor.red,
    onError: _AppColor.white,
    background: _AppColor.accentColorDark,
    onBackground: _AppColor.white,
    surface: _AppColor.accentColorDark,
    onSurface: _AppColor.white,
  );
}
