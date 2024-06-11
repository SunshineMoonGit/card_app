import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/core/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsLayout extends ConsumerWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool safeAreaTop;
  final String? appBarTitle;
  final List<Widget>? actions;

  const SsLayout({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.safeAreaTop = false,
    this.appBarTitle,
    this.actions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBarTitle == null
          ? null
          : AppBar(
              centerTitle: false,
              title: Padding(
                padding: Dimensions.kPaddingHorizontalLarge,
                child: Text(appBarTitle!),
              ),
              actions: actions,
            ),
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: safeAreaTop,
        bottom: false,
        child: body,
      ),
    );
  }
}
