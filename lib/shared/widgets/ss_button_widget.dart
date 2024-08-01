import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Color backgroundColor;
  final Color? textColor;
  final void Function()? onTap;

  const SsButtonWidget({
    super.key,
    this.icon,
    required this.title,
    required this.backgroundColor,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.ssScreenWidth20,
        right: Dimensions.ssScreenWidth20,
        bottom: Dimensions.ssScreenHeight10,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              Dimensions.ssBorderRadiusSmall,
            ),
          ),
          height: 54.h,
          child: Row(
            children: [
              if (icon != null) _renderPrefixIcon(),
              _renderTitle(),
              if (icon != null) _renderPadding(),
            ],
          ),
        ),
      ),
    );
  }

  Container _renderPadding() {
    return Container(
      padding: Dimensions.ssPaddingHorizontal,
      child: Icon(
        icon,
        size: 20.w,
        color: backgroundColor,
      ),
    );
  }

  Expanded _renderTitle() {
    return Expanded(
      child: Center(
        child: SsText(
          title: title,
          style: const TextStyle(),
          color: textColor,
        ),
      ),
    );
  }

  Container _renderPrefixIcon() {
    return Container(
      padding: Dimensions.ssPaddingHorizontal,
      child: Icon(
        icon,
        size: 24.w,
      ),
    );
  }
}
