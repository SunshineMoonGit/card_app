import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/settings/presentation/provider/theme_provider.dart';
import 'package:card_app/features/settings/presentation/screens/setting_auth_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_edit_text_form_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_language_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_display_screen.dart';
import 'package:card_app/shared/provider/app_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppSetting {
  final IconData? icon;
  final String title;
  final void Function(AppSetting) onTap;
  final String? detail;
  final bool value;
  final SettingRowType rowType;

  AppSetting({
    this.icon,
    required this.title,
    required this.onTap,
    this.detail,
    this.rowType = SettingRowType.string,
    this.value = false,
  });

  static List<AppSetting> settingTypeOfList({
    required SettingType type,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final appSettings = AppSettingFactory(context, ref);

    switch (type) {
      case SettingType.main:
        return appSettings.main();
      case SettingType.auth:
        return appSettings.auth();
      case SettingType.profile:
        return appSettings.profile();
      case SettingType.theme:
        return appSettings.theme();
      case SettingType.language:
        return appSettings.language();
      default:
        return [];
    }
  }
}

class AppSettingFactory {
  final BuildContext context;
  final WidgetRef ref;
  late final AppMethod appMethod;

  AppSettingFactory(
    this.context,
    this.ref,
  ) {
    appMethod = AppMethod(ref);
  }

  void pushTextEditing(AppSetting setting) {
    context.push(SettingEditTextFormScreen.route, extra: setting);
  }

  List<AppSetting> main() {
    return [
      AppSetting(title: AppString.auth, onTap: (_) => context.push(SettingAuthScreen.route), icon: Icons.person),
      AppSetting(title: AppString.display, onTap: (_) => context.push(SettingDisplayScreen.route), icon: Icons.pallet),
      AppSetting(
          title: AppString.language, onTap: (_) => context.push(SettingLanguageScreen.route), icon: Icons.person),
    ];
  }

  List<AppSetting> auth() {
    return [
      AppSetting(title: AppString.aboutSignIn, onTap: (_) {}, detail: '구글'),
    ];
  }

  List<AppSetting> profile() {
    final UserInfoEntity auth = ref.watch(authInfoProvider);

    return [
      AppSetting(title: AppString.name, onTap: (_) => pushTextEditing(_), detail: auth.name),
      AppSetting(title: AppString.company, onTap: (_) => pushTextEditing(_), detail: auth.company),
      AppSetting(title: AppString.team, onTap: (_) => pushTextEditing(_), detail: auth.team),
      AppSetting(title: AppString.phone, onTap: (_) => pushTextEditing(_), detail: auth.phone),
      AppSetting(title: AppString.email, onTap: (_) => pushTextEditing(_), detail: auth.email),
      AppSetting(title: AppString.fax, onTap: (_) => pushTextEditing(_), detail: auth.fax),
      AppSetting(title: AppString.external, onTap: (_) {}),
    ];
  }

  List<AppSetting> theme() {
    return [
      AppSetting(
        title: AppString.darkMode,
        onTap: (_) => appMethod.changeTheme(),
        value: ref.watch(themeProvider),
        rowType: SettingRowType.bool,
      ),
    ];
  }

  List<AppSetting> language() {
    return [
      AppSetting(
        title: AppString.en,
        onTap: (_) => appMethod.changeLanguageTemp(AppString.en),
        value: appMethod.checkLanguageTemp(AppString.en),
        rowType: SettingRowType.check,
      ),
      AppSetting(
        title: AppString.ko,
        onTap: (_) => appMethod.changeLanguageTemp(AppString.ko),
        value: appMethod.checkLanguageTemp(AppString.ko),
        rowType: SettingRowType.check,
      ),
    ];
  }
}
