import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class SsRenderSettingColumnWidget extends StatelessWidget {
  final String? title;
  final Widget child;

  const SsRenderSettingColumnWidget({
    super.key,
    this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.ssScreenHeight20 / 2,
          horizontal: Dimensions.ssScreenWidth20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: Dimensions.ssPaddingVertical / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
                color: context.colorScheme.secondary,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
