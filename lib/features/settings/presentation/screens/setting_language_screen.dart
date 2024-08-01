import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/presentation/widget/ss_save_button_widget.dart';
import 'package:card_app/features/commons/presentation/splash_screen.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/features/settings/presentation/provider/setting_language_temp_provider.dart';
import 'package:card_app/features/settings/presentation/provider/settings_provider.dart';
import 'package:card_app/features/settings/presentation/widget/ss_render_setting_row_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_render_setting_column_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingLanguageScreen extends ConsumerWidget {
  static String get route => '/setting_language';

  const SettingLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String languageTemp = ref.watch(settingLanguageTempProvider);
    final SettingsModel settings = ref.watch(settingsProvider)!;

    return SsLayout(
      appBarTitle: 'language',
      centerTitle: true,
      bottomNavToggle: false,
      body: CustomScrollView(
        slivers: [
          const SsRenderSettingColumnWidget(
            child: SsRenderSettingRowWidget(type: SettingType.language),
          ),
          SliverToBoxAdapter(
            child: SsSaveButtonWidget(
              onTap: () {
                ref.read(settingsProvider.notifier).update(
                      settings.copyWith(
                        language: languageTemp,
                      ),
                    );

                context.go(SplashScreen.route, extra: true);
              },
            ),
          )
        ],
      ),
    );
  }
}
