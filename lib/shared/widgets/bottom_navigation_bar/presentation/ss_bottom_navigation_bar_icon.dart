import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/model/bottom_navigation_bar_icon.dart';
import 'package:flutter/material.dart';

class SsBottomNavigationBarIcon extends StatelessWidget {
  final double bottomNavigationSize;
  final BottomNavigationBarIconModel item;
  final bool isIndex;

  const SsBottomNavigationBarIcon({
    super.key,
    required this.bottomNavigationSize,
    required this.item,
    required this.isIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        // color: SsColor.accentColor.withOpacity(0),
        width: bottomNavigationSize,
        height: bottomNavigationSize,
        child: Icon(
          isIndex ? item.selectedIcon : item.icon,
          color: context.theme.primaryColor,
        ),
      ),
    );
  }
}
