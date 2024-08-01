import 'dart:io';

import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/wallet/presentation/provider/custom_image_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/modal/modal_toggle_provider.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_card_widget/ss_user_info_card_summary_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsUserInfoCardSummaryEdit extends ConsumerWidget {
  const SsUserInfoCardSummaryEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? cardImagePath = ref.watch(customImageProvider);

    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: GestureDetector(
          onTap: () {},
          child: SsCardImageContainerWidget(
            color: context.colorScheme.secondary,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
              child: _renderBusinessCardImage(
                onTap: () => ref.read(modalToggleProvider.notifier).show(),
                cardImgUrl: cardImagePath,
                addIconColor: context.colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderBusinessCardImage({
    required Function()? onTap,
    required String? cardImgUrl,
    required Color addIconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: cardImgUrl != null
          ? Image.file(
              File(cardImgUrl),
              fit: BoxFit.cover,
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.ssBorderRadiusMedium,
                ),
              ),
              child: Center(
                child: Icon(Icons.add, color: addIconColor),
              ),
            ),
    );
  }
}
