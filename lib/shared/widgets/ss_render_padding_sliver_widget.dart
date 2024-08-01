import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:flutter/material.dart';

class SsRenderPaddingSliverWidget extends StatelessWidget {
  final Widget child;
  const SsRenderPaddingSliverWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          right: Dimensions.ssScreenWidth20,
          left: Dimensions.ssScreenWidth20,
          bottom: Dimensions.ssScreenHeight20,
        ),
        child: child,
      ),
    );
  }
}
