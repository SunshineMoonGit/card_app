part of 'app_theme.dart';

@immutable
class _AppBarTheme {
  static final _appBarLightTheme = AppBarTheme(
    toolbarHeight: 50,
    backgroundColor: _AppColor.white,
    titleTextStyle: _TextTheme._textLightTheme.headlineLarge,
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: const IconThemeData(color: _AppColor.black),
    iconTheme: const IconThemeData(
      color: _AppColor.black,
    ),
  );

  static final _appBarDarkTheme = AppBarTheme(
    toolbarHeight: 50,
    backgroundColor: Colors.transparent,
    titleTextStyle: _TextTheme._textDarkTheme.headlineLarge,
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: const IconThemeData(color: _AppColor.white),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    foregroundColor: _AppColor.white,
  );
}
