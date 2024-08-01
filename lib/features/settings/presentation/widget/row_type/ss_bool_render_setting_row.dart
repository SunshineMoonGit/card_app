import 'package:card_app/config/app/app_setting.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsBoolRenderSettingRow extends StatelessWidget {
  final AppSetting setting;
  const SsBoolRenderSettingRow({
    super.key,
    required this.setting,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setting.onTap(setting),
      child: SizedBox(
        // padding: Dimensions.ssPaddingVertical / 2,
        height: 16.sp + 30.h,
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
              child: Switch(
                value: setting.value,
                onChanged: (value) => setting.onTap(setting),

                activeTrackColor: context.colorScheme.primary,
                activeColor: context.colorScheme.onPrimaryContainer,
                // materialTapTargetSize: MaterialTapTargetSize.values[1], // Reduces the tap target size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
