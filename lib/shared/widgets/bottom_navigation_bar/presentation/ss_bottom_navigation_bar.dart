import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/wallet/presentation/provider/page_index_provider.dart';
import 'package:card_app/shared/provider/bottom_navigation_bar_icon_provider.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/model/bottom_navigation_bar_icon.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/presentation/ss_bottom_navigation_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsBottomNavigationBar extends ConsumerWidget {
  const SsBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<BottomNavigationBarIconModel> items = ref.read(bottomNavigationBarIconProvider(context));
    final int pageIndex = ref.watch(pageIndexProvider);

    // double bottomNavigationSize = SsUi.deviceWidth / 8;
    double bottomNavigationSize = MediaQuery.sizeOf(context).width / 8;
    final double additionalBottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      height: kBottomNavigationBarHeight + additionalBottomPadding,
      decoration: BoxDecoration(
        // color: context.colorScheme.surface,
        color: context.colorScheme.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.ssBorderRadiusMedium)),
        boxShadow: [
          // if (context.theme.brightness == Brightness.light)
          BoxShadow(
            color: context.colorScheme.tertiary,
            blurRadius: 20.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 10),
          ),
        ],
        // border: Border(
        //   top: BorderSide(color: context.theme.colorScheme.secondary, width: 1),
        // ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: additionalBottomPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            items.length,
            (index) {
              return SsBottomNavigationBarIcon(
                bottomNavigationSize: bottomNavigationSize * 1.25,
                item: items[index],
                isIndex: pageIndex == index,
              );
            },
          ),
        ),
      ),
    );
  }
}
