import 'package:card_app/features/wallet/presentation/provider/page_index_provider.dart';
import 'package:card_app/shared/functions/ss_print.dart';
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
    final List<BottomNavigationBarIconModel> items = ref.read(bottomNavigationBarIconProvider);
    final int pageIndex = ref.watch(pageIndexProvider);

    // double bottomNavigationSize = SsUi.deviceWidth / 8;
    double bottomNavigationSize = MediaQuery.sizeOf(context).width / 8;

    return Container(
      height: bottomNavigationSize * 1.25,
      decoration: BoxDecoration(
        // border: const Border(
        //   top: BorderSide(
        //     color: Colors.grey,
        //   ),
        // ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
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
    );
  }
}
