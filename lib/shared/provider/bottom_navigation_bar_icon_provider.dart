import 'package:card_app/features/wallet/presentation/provider/page_index_provider.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/model/bottom_navigation_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_bar_icon_provider.g.dart';

@riverpod
List<BottomNavigationBarIconModel> bottomNavigationBarIcon(Ref ref, BuildContext context) {
  List<BottomNavigationBarIconModel> items = [
    BottomNavigationBarIconModel(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      onTap: () => ref.read(pageIndexProvider.notifier).changeIndex(0),
    ),
    BottomNavigationBarIconModel(
      icon: Icons.people_alt_outlined,
      selectedIcon: Icons.people_alt,
      onTap: () => ref.read(pageIndexProvider.notifier).changeIndex(1),
    ),
    BottomNavigationBarIconModel(
      icon: Icons.add_circle_outline,
      selectedIcon: Icons.add_circle,
      onTap: () => ref.read(pageIndexProvider.notifier).changeIndex(2),
    ),
    BottomNavigationBarIconModel(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      onTap: () => ref.read(pageIndexProvider.notifier).changeIndex(3),
    ),
  ];
  return items;
}
