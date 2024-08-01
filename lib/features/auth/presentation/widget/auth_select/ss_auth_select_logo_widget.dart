import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsAuthSelectLogoWidget extends StatelessWidget {
  const SsAuthSelectLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SsText(
        title: AppString.appName,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w900,
          fontSize: 50.w,
        ),
        color: context.colorScheme.primary,
      ),
    );
  }
}
