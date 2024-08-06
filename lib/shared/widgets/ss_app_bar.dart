import 'dart:io';

import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final Color statusBarColor;
  final List<Widget>? actions;
  final bool? centerTitle;
  final void Function()? leading;
  final bool leadingToggle;

  const SsAppBar({
    super.key,
    this.appBarTitle,
    this.actions,
    required this.statusBarColor,
    this.centerTitle = false,
    this.leadingToggle = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: _uiByPlatform(
        isIos: Platform.isIOS,
        brightness: context.theme.brightness,
        navBarColor: context.colorScheme.background,
        statusBarColor: statusBarColor,
      ),
      leading: leadingToggle
          ? GestureDetector(
              onTap: leading,
              child: const Icon(Icons.arrow_back_ios),
            )
          : null,
      toolbarHeight: null,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: context.colorScheme.background,
      automaticallyImplyLeading: true,
      centerTitle: centerTitle,
      title: Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: SsText(
          title: '$appBarTitle',
          style: context.textTheme.headlineLarge!,
        ),
      ),
      actions: actions,
    );
  }

  SystemUiOverlayStyle _uiByPlatform({
    required bool isIos,
    required Brightness brightness,
    required Color statusBarColor,
    required Color navBarColor,
  }) {
    if (isIos) {
      return SystemUiOverlayStyle(
        statusBarBrightness: statusBarBrightness(
          brightness: brightness,
          statusBarColor: statusBarColor,
        ),
      );
    } else {
      late Brightness reverseBrightness;
      if (brightness == Brightness.light) {
        reverseBrightness = Brightness.dark;
      } else {
        reverseBrightness = Brightness.light;
      }

      return SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: statusBarBrightness(brightness: brightness, statusBarColor: statusBarColor),
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: navBarColor,
        systemNavigationBarIconBrightness: reverseBrightness,
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Brightness statusBarBrightness({
  required Brightness brightness,
  required Color statusBarColor,
}) {
  final bool criterion = (statusBarColor.computeLuminance() >= 0.5);

  if (Platform.isIOS) {
    if (brightness == Brightness.light) {
      if (criterion) {
        return Brightness.light;
      } else {
        return Brightness.dark;
      }
    }

    if (brightness == Brightness.dark) {
      if (criterion) {
        return Brightness.light;
      } else {
        return Brightness.dark;
      }
    }
  } else {
    if (brightness == Brightness.light) {
      if (criterion) {
        return Brightness.dark;
      } else {
        return Brightness.light;
      }
    }

    if (brightness == Brightness.dark) {
      if (criterion) {
        return Brightness.dark;
      } else {
        return Brightness.light;
      }
    }
  }
  return Brightness.light;
}
