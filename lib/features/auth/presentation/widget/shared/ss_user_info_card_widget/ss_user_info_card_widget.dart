import 'dart:io';
import 'dart:ui';

import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/commons/presentation/full_image_viewer_screen.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_card_widget/ss_user_info_card_summary_container_widget.dart';
import 'package:card_app/shared/widgets/ss_render_padding_sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// # auth_profile_screen
// # auth_user_info_screen

class SsUserInfoCardWidget extends StatefulWidget {
  final UserInfoEntity userData;
  final bool isEditPage;

  const SsUserInfoCardWidget({
    super.key,
    required this.userData,
    this.isEditPage = false,
  });

  @override
  State<SsUserInfoCardWidget> createState() => _SsUserInfoCardWidgetState();
}

class _SsUserInfoCardWidgetState extends State<SsUserInfoCardWidget> {
  bool cardToggle = false;

  @override
  Widget build(BuildContext context) {
    return SsRenderPaddingSliverWidget(
      child: Stack(
        children: [
          //@ Business Card Image + blur + opacity
          _renderBusinessCard(
            cardToggle: cardToggle,
            cardImgUrl: widget.userData.cardImage,
          ),

          //@ Profile Image
          _renderProfileImage(
            cardToggle: cardToggle,
            profileImgUrl:
                'https://img.khan.co.kr/news/2023/01/02/news-p.v1.20230102.1f95577a65fc42a79ae7f990b39e7c21_P1.webp',
          ),

          //@ Toggle
          _renderCardToggleIcon(context)
        ],
      ),
    );
  }

  Widget _renderProfileImage({
    required bool cardToggle,
    required String profileImgUrl,
  }) {
    if (cardToggle) {
      return Container();
    } else {
      return SsCardImageContainerWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SsCardImageContainerWidget(
              isProfileImageWidget: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.ssScreenHeight40 * 3),
                child: GestureDetector(
                  onTap: () => context.push(FullImageViewerScreen.route, extra: profileImgUrl),
                  child: Image.network(
                    profileImgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _renderBusinessCard({
    required bool cardToggle,
    required String? cardImgUrl,
  }) {
    return Stack(
      children: [
        SsCardImageContainerWidget(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusSmall),
            child: cardToggle
                ? GestureDetector(
                    onTap: () => context.push(FullImageViewerScreen.route, extra: cardImgUrl),
                    child: cardImgUrl != null
                        ? Image.file(
                            File(cardImgUrl),
                            fit: BoxFit.cover,
                          )
                        : Container(color: context.colorScheme.tertiary),
                    // Image.network(
                    //   cardImgUrl,
                    //   fit: BoxFit.cover,
                    // ),
                  )
                : ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: cardImgUrl != null
                        ? Image.file(
                            File(cardImgUrl),
                            fit: BoxFit.cover,
                          )
                        : Container(color: context.colorScheme.tertiary)
                    // Image.network(
                    //   cardImgUrl,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
          ),
        ),
        if (!cardToggle)
          SsCardImageContainerWidget(
            color: Colors.white.withOpacity(.5),
            child: Container(),
          )
      ],
    );
  }

  Positioned _renderCardToggleIcon(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      child: GestureDetector(
        onTap: () {
          setState(() {
            cardToggle = !cardToggle;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.secondary,
          ),
          child: Icon(
            cardToggle ? Icons.visibility : Icons.visibility_off,
            color: context.colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
