import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class Dimensions {
  //@ Widget Size
  static final ssHomeTopWidgetHeight = 250.h;

  //@ Screen Size
  static final ssScreenWidth60 = 60.w;
  static final ssScreenWidth40 = 40.w;
  static final ssScreenWidth20 = 20.w;
  static final ssScreenWidth10 = 10.w;
  static final ssScreenHeight60 = 60.h;
  static final ssScreenHeight40 = 40.h;
  static final ssScreenHeight20 = 20.h;
  static final ssScreenHeight10 = 10.h;

  //@ BorderRadius
  static double ssBorderRadiusLarge = 24;
  static double ssBorderRadiusMedium = 16;
  static double ssBorderRadiusSmall = 8;

  //@ Padding
  static final ssPaddingAll = const EdgeInsets.all(20.0).w;

  static final ssPaddingHorizontal = const EdgeInsets.symmetric(horizontal: 20.0).w;
  static final ssPaddingVertical = const EdgeInsets.symmetric(vertical: 20.0).h;

  //@ Text font size
  static final double ssTextFontSizeLarge = 24.sp;
  static final double ssTextFontSizeMedium = 20.sp;
  static final double ssTextFontSizeSmall = 16.sp;

  static final ssVerticalSpaceLarge = SizedBox(height: 25.h);
  static final ssVerticalSpaceMedium = SizedBox(height: 16.h);
  static final ssVerticalSpaceSmall = SizedBox(height: 10.h);
  static final ssHorizontalSpaceLarge = SizedBox(width: 25.w);
  static final ssHorizontalSpaceMedium = SizedBox(height: 16.w);
  static final ssHorizontalSpaceSmall = SizedBox(width: 10.w);
}
