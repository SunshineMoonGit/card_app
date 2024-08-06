import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFavoritesWidget extends ConsumerWidget {
  const HomeFavoritesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<UserInfoEntity> userInfoList = ref.watch(walletProvider).favorites;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: Dimensions.ssPaddingHorizontal,
            child: SsText(
              title: 'favorite',
              style: context.theme.textTheme.headlineLarge!,
              color: context.colorScheme.onBackground,
            ),
          ),
          Dimensions.ssVerticalSpaceSmall,
          if (userInfoList.isEmpty)
            SsText(
              title: 'EMPTY',
              style: context.textTheme.bodyMedium!,
            ),
          Container(
            padding: Dimensions.ssPaddingHorizontal,
            height: 225.h * ((userInfoList.length + 1) ~/ 2),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisExtent: 450.h / 2 - 20.h,
                mainAxisSpacing: 20.h,
              ),
              itemCount: userInfoList.length,
              itemBuilder: (BuildContext context, int index) {
                return HomeCardWidget(userInfo: userInfoList[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class HomeCardWidget extends StatelessWidget {
  final UserInfoEntity userInfo;

  const HomeCardWidget({
    required this.userInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if (context.theme.brightness == Brightness.light)
            BoxShadow(
              color: context.colorScheme.secondary,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: const Offset(5, 5),
            ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: context.theme.colorScheme.background,
            ),
            child: Column(
              children: [
                Dimensions.ssVerticalSpaceSmall,
                CircleAvatar(
                  radius: 30.h,
                  foregroundImage: const NetworkImage(
                      'https://moviewalker.jp/api/resizeimage/person/10/f6/10f68aa2ac2da8f5a6c5d858b2c44faa.jpg?w=690'),
                ),
                Dimensions.ssVerticalSpaceSmall,
                SsText(
                  title: userInfo.name,
                  style: context.theme.textTheme.bodyLarge!,
                  color: context.theme.colorScheme.onSecondary,
                ),
                SsText(
                  title: userInfo.company,
                  style: context.theme.textTheme.bodySmall!,
                  color: context.theme.colorScheme.onSecondary,
                ),
                SsText(
                  title: userInfo.team,
                  style: context.theme.textTheme.bodySmall!,
                  color: context.theme.colorScheme.onSecondary,
                ),
                Dimensions.ssVerticalSpaceSmall,
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.yellow,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call,
                          size: 16.h,
                          color: context.theme.colorScheme.onSecondary,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.message,
                          size: 16.h,
                          color: context.theme.colorScheme.onSecondary,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.email,
                          size: 16.h,
                          color: context.theme.colorScheme.onSecondary,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.share,
                          size: 16.h,
                          color: context.theme.colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
