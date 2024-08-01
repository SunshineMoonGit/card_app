import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';

class SsHorizontalPaddingTitleWidget extends StatelessWidget {
  final String title;

  const SsHorizontalPaddingTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: SsText(
          title: title,
          style: context.theme.textTheme.headlineMedium!,
          color: context.colorScheme.onBackground,
        ),
      ),
    );
  }
}
