import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsInfoWithIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const SsInfoWithIconWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: context.theme.colorScheme.onBackground,
          ),
          SizedBox(width: 10.h),
          SsText(
            title: title,
            style: context.textTheme.bodySmall!,
            color: context.colorScheme.onBackground,
          ),
        ],
      ),
    );
  }
}
