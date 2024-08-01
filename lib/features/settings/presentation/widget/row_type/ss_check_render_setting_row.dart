import 'package:card_app/config/app/app_setting.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsCheckRenderSettingRow extends ConsumerWidget {
  final AppSetting setting;

  const SsCheckRenderSettingRow({
    super.key,
    required this.setting,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        setting.onTap(setting);
      },
      child: SizedBox(
        // padding: Dimensions.ssPaddingVertical / 2,
        height: 16.sp + 25.h,
        child: Row(
          children: [
            if (setting.icon != null)
              Padding(
                padding: Dimensions.ssPaddingHorizontal,
                child: Icon(
                  setting.icon,
                  color: context.colorScheme.onBackground,
                ),
              ),
            Expanded(
              child: Padding(
                padding: (setting.icon != null) ? EdgeInsets.zero : Dimensions.ssPaddingHorizontal,
                child: SsText(
                  title: setting.title,
                  style: context.textTheme.bodySmall!,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
            Padding(
              padding: Dimensions.ssPaddingHorizontal,
              child: Row(
                children: [
                  if (setting.detail != null)
                    SsText(
                      title: '${setting.detail}',
                      style: context.textTheme.labelLarge!,
                      color: context.colorScheme.onSurface,
                    ),
                  Dimensions.ssHorizontalSpaceSmall,
                  if (setting.value)
                    Icon(
                      Icons.check,
                      color: context.colorScheme.onSurface,
                      size: 16.sp,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
