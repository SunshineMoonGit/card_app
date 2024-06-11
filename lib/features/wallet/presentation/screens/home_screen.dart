import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/features/wallet/presentation/widget/home_top_widget.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/presentation/ss_bottom_navigation_bar.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  static String get route => '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double textSize = 30.h;
    final double homeTopWidgetSize = 250.h;
    final double bottomNavSize = (MediaQuery.sizeOf(context).width / 8 * 1.25);

    final double homeGridSize = MediaQuery.sizeOf(context).height -
        homeTopWidgetSize -
        Dimensions.kVerticalSpaceSmall.height! * 2 -
        textSize -
        bottomNavSize;

    final UserInfoModel myData = ref.watch(authProvider);
    final List<UserInfoModel> wallet = ref.watch(walletProvider)!;

    return SsLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTopWidget(widgetSize: homeTopWidgetSize),
          Dimensions.kVerticalSpaceSmall,
          Container(
            padding: Dimensions.kPaddingHorizontalLarge,
            height: textSize,
            child: Text(
              '최근 본 명함',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Dimensions.kVerticalSpaceSmall,
          Container(
            padding: Dimensions.kPaddingHorizontalLarge,
            height: homeGridSize,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisExtent: homeGridSize / 2 - 20.h,
                mainAxisSpacing: 20.h,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return HomeCardWidget(userInfo: wallet[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const SsBottomNavigationBar(),
    );
  }
}

class HomeCardWidget extends StatelessWidget {
  final UserInfoModel userInfo;

  const HomeCardWidget({
    required this.userInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(7, 7),
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
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Column(
              children: [
                Dimensions.kVerticalSpaceSmaller,
                CircleAvatar(
                  radius: 30.h,
                  foregroundImage: const NetworkImage(
                      'https://moviewalker.jp/api/resizeimage/person/10/f6/10f68aa2ac2da8f5a6c5d858b2c44faa.jpg?w=690'),
                ),
                Dimensions.kVerticalSpaceSmaller,
                Text(
                  userInfo.name!,
                  style:
                      Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                ),
                Text(
                  userInfo.company!,
                  style:
                      Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                ),
                Text(
                  userInfo.team!,
                  style:
                      Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                ),
                Dimensions.kVerticalSpaceSmaller,
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
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call,
                          size: 16.h,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.message,
                          size: 16.h,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.email,
                          size: 16.h,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.share,
                          size: 16.h,
                          color: Theme.of(context).colorScheme.onSecondary,
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
