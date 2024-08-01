import 'package:card_app/config/app/app_path.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsCardImageContainerWidget extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool isProfileImageWidget;

  const SsCardImageContainerWidget({
    required this.child,
    this.padding,
    this.color,
    this.isProfileImageWidget = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = context.deviceSize.width - (20.h * 2);

    final double cardHeight = cardWidth * AppPath.standardCardRatio;

    return Container(
      padding: padding,
      width: isProfileImageWidget ? cardHeight / 2 : cardWidth,
      height: isProfileImageWidget ? cardHeight / 2 : cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isProfileImageWidget ? 200 : Dimensions.ssBorderRadiusSmall),
        color: color,
      ),
      child: child,
    );
  }
}
