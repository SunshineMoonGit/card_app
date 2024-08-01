part of 'app_theme.dart';

@immutable
class _AppBarTheme {
  static final _appBarLightTheme = AppBarTheme(
    // toolbarHeight: 54,
    backgroundColor: Colors.transparent,
    titleTextStyle: _TextTheme._textLightTheme.headlineLarge!.copyWith(
      color: _AppColorScheme._lightColorScheme.onBackground,
    ),
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: IconThemeData(color: _AppColorScheme._lightColorScheme.onBackground),
    iconTheme: IconThemeData(
      color: _AppColorScheme._lightColorScheme.onBackground,
    ),
  );

  static final _appBarDarkTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    titleTextStyle: _TextTheme._textDarkTheme.headlineLarge,
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: IconThemeData(color: _AppColorScheme._lightColorScheme.onPrimary),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    foregroundColor: _AppColorScheme._lightColorScheme.onPrimary,
  );
}
