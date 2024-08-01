import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_setting.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/settings/presentation/widget/row_type/ss_bool_render_setting_row.dart';
import 'package:card_app/features/settings/presentation/widget/row_type/ss_check_render_setting_row.dart';
import 'package:card_app/features/settings/presentation/widget/row_type/ss_string_render_setting_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsRenderSettingRowWidget extends ConsumerWidget {
  final SettingType type;

  const SsRenderSettingRowWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AppSetting> settings = AppSetting.settingTypeOfList(
      type: type,
      context: context,
      ref: ref,
    );

    return Column(
      children: List.generate(
        settings.length * 2 - 1,
        (index) {
          final int pIndex = index ~/ 2;
          if (index % 2 == 0) {
            switch (settings[pIndex].rowType) {
              case SettingRowType.string:
                return SsStringRenderSettingRow(setting: settings[pIndex]);
              case SettingRowType.bool:
                return SsBoolRenderSettingRow(setting: settings[pIndex]);
              case SettingRowType.check:
                return SsCheckRenderSettingRow(setting: settings[pIndex]);
              default:
                return Container();
            }
          } else {
            return RenderDivider(iconData: settings[pIndex].icon);
          }
        },
      ),
    );
  }
}

class RenderDivider extends StatelessWidget {
  final IconData? iconData;
  const RenderDivider({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (iconData != null)
          Padding(
            padding: Dimensions.ssPaddingHorizontal,
            child: const SizedBox(width: kDefaultFontSize),
          ),
        Expanded(
          child: Divider(
            color: context.colorScheme.tertiary,
            height: 20,
          ),
        ),
      ],
    );
  }
}
