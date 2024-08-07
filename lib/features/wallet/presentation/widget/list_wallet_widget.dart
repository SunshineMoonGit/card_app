import 'package:card_app/config/app/app_path.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/screens/auth_user_info_screen.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_image_file_widget.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ListWalletWidget extends StatelessWidget {
  final List<FollowingEntity<UserInfoEntity>> followings;

  const ListWalletWidget({
    super.key,
    required this.followings,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = 100.w;
    final double cardHeight = cardWidth * AppPath.standardCardRatio;
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: Dimensions.ssPaddingHorizontal,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              context.push(
                AuthUserInfoScreen.route,
                extra: followings[index],
              );
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colorScheme.tertiary,
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusSmall)),
                  width: cardWidth,
                  height: cardHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusSmall),
                    child: SsImageFileWidget(imagePath: followings[index].user.cardImage),
                  ),
                ),
                Dimensions.ssHorizontalSpaceLarge,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SsText(
                      title: followings[index].user.name,
                      style: context.textTheme.bodyLarge!,
                      color: context.colorScheme.onBackground,
                    ),
                    SsText(
                      title: '${followings[index].user.company} ',
                      style: context.textTheme.bodySmall!,
                      color: context.colorScheme.onBackground,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Dimensions.ssVerticalSpaceSmall;
        // return const Divider(
        //   color: Colors.grey,
        // );
      },
      itemCount: followings.length,
    );
  }
}
