import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsSaveButtonWidget extends ConsumerWidget {
  final void Function() onTap;

  const SsSaveButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: Dimensions.ssPaddingAll,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 60.h,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusSmall),
          ),
          child: Center(
            child: SsText(
              title: AppString.save,
              style: context.textTheme.bodyMedium!,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
