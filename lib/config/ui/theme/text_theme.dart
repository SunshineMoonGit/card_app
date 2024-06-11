part of 'app_theme.dart';

@immutable
class _TextTheme {
  static final _textLightTheme = TextTheme(
    ///DISPLAY
    displayLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),
    displayMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),
    displaySmall: TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),

    //HEADLINE
    headlineLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),

    //TITLE
    titleLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColor,
    ),

    //BODY
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColor,
    ),
    bodySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColor,
    ),

    //LABEL
    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColor,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColor,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColor,
    ),
  );

  //DARK MODE
  static final _textDarkTheme = TextTheme(
    ///DISPLAY
    displayLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),
    displayMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),
    displaySmall: TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),

    //HEADLINE
    headlineLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),

    //TITLE
    titleLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: _AppColor.textColorDark,
    ),

    //BODY
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColorDark,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColorDark,
    ),
    bodySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColorDark,
    ),

    //LABEL
    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColorDark,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColorDark,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: _AppColor.textColorDark,
    ),
  );
}
