import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/features/settings/presentation/widget/ss_render_setting_row_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_render_setting_column_widget.dart.dart';
import 'package:flutter/material.dart';

class SettingAuthScreen extends StatelessWidget {
  static String get route => '/setting_auth';

  const SettingAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SsLayout(
      appBarTitle: AppString.auth,
      centerTitle: true,
      bottomNavToggle: false,
      body: CustomScrollView(
        slivers: [
          SsRenderSettingColumnWidget(
            // title: AppString.signIn,
            child: SsRenderSettingRowWidget(type: SettingType.auth),
          ),
          SsRenderSettingColumnWidget(
            title: AppString.aboutProfile,
            child: SsRenderSettingRowWidget(type: SettingType.profile),
          ),
        ],
      ),
    );
  }
}
