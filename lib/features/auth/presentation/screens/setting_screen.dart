import 'package:card_app/shared/widgets/bottom_navigation_bar/presentation/ss_bottom_navigation_bar.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SsLayout(
      body: Container(),
      bottomNavigationBar: const SsBottomNavigationBar(),
    );
  }
}
