import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/presentation/widget/auth_select/ss_auth_select_log_in_methods_widget.dart';
import 'package:card_app/features/auth/presentation/widget/auth_select/ss_auth_select_logo_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSelectScreen extends ConsumerWidget {
  static String get route => '/auth_select';

  const AuthSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SsLayout(
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SsAuthSelectLogoWidget()),
          SsAuthSelectLogInMethodsWidget(),
        ],
      ),
      bottomNavToggle: false,
      statusBarColor: context.colorScheme.secondary,
    );
  }
}
