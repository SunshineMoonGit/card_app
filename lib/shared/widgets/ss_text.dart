import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SsText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Color? color;
  const SsText({
    required this.title,
    this.style,
    this.textAlign,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Intl.message(title),
      textAlign: textAlign,
      style: style == null
          ? context.textTheme.bodyMedium!.copyWith(
              color: color ?? context.colorScheme.onSurface,
            )
          : style!.copyWith(
              color: color ?? context.colorScheme.onSurface,
            ),
    );
  }
}
