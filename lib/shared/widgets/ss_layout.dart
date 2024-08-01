import 'dart:io';

import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/functions/ss_ui_style.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/presentation/ss_bottom_navigation_bar.dart';
import 'package:card_app/shared/widgets/ss_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsLayout extends ConsumerWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool safeAreaTop;
  final String? appBarTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? statusBarColor;
  final bool bottomNavToggle;
  final bool centerTitle;

  const SsLayout({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.safeAreaTop = false,
    this.appBarTitle,
    this.actions,
    this.backgroundColor,
    this.statusBarColor,
    this.bottomNavToggle = true,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget bottomNavBar = bottomNavigationBar ?? const SsBottomNavigationBar();
    // Color statusBarColor = this.;
    if (appBarTitle == null) {
      ssUiStyle(
        brightness: context.theme.brightness,
        isIOS: Platform.isIOS,
        statusBarColor: statusBarColor ?? context.colorScheme.background,
        navBarColor: context.colorScheme.background,
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBarTitle == null
            ? null
            : SsAppBar(
                actions: actions,
                appBarTitle: appBarTitle,
                centerTitle: centerTitle,
                statusBarColor: statusBarColor ?? context.colorScheme.background,
              ),
        bottomNavigationBar: bottomNavToggle ? bottomNavBar : null,
        backgroundColor: backgroundColor ?? context.colorScheme.background,
        body: SafeArea(
          top: false,
          bottom: false,
          child: body,
        ),
      ),
    );
  }
}
