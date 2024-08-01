import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';

class EmptyWalletWidget extends StatelessWidget {
  const EmptyWalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.ssPaddingHorizontal,
      child: Center(
        child: SsText(
          title: 'oops',
          style: context.textTheme.displayMedium!,
          color: context.colorScheme.onBackground,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
