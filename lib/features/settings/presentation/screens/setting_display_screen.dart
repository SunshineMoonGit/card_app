import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/features/settings/presentation/widget/ss_render_setting_row_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_render_setting_column_widget.dart.dart';
import 'package:flutter/material.dart';

class SettingDisplayScreen extends StatelessWidget {
  static String get route => '/setting_display';

  const SettingDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SsLayout(
      appBarTitle: AppString.display,
      centerTitle: true,
      bottomNavToggle: false,
      body: CustomScrollView(
        slivers: [
          SsRenderSettingColumnWidget(
            title: AppString.aboutDisplay,
            child: SsRenderSettingRowWidget(type: SettingType.theme),
          ),
        ],
      ),
    );
  }
}
