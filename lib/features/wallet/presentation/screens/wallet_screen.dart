import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:card_app/features/auth/presentation/screens/user_info_screen.dart';
import 'package:card_app/features/wallet/domain/model/wallet_item_model.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/presentation/ss_bottom_navigation_bar.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/ss_bottom_slider.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
// import 'package:we_slide/we_slide.dart';

class WalletScreen extends ConsumerWidget {
  static String get route => '/';

  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserInfoModel myData = ref.watch(authProvider);
    final List<UserInfoModel> wallet = ref.watch(walletProvider)!;

    if (wallet.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    ssPrint(wallet, 'WalletScreen');

    // 페이지 length -> page뷰 갯수 + indicator
    // folder -> length 2 이상일때

    return SsLayout(
      appBarTitle: '지갑',
      bottomNavigationBar: const SsBottomNavigationBar(),
      actions: [
        GestureDetector(
          onTap: () => ssPrint('tap! search', 'WalletScreen'),
          child: const Icon(Icons.search),
        ),
        Dimensions.kHorizontalSpaceSmall,
        GestureDetector(
          onTap: () => ssPrint('tap! settings', 'WalletScreen'),
          child: const Icon(Icons.settings),
        ),
        Dimensions.kHorizontalSpaceMedium,
      ],
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: Dimensions.kPaddingHorizontalLarge,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.push(
                  UserInfoScreen.route,
                  extra: wallet[index],
                );
              },
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.h,
                      foregroundImage: const NetworkImage(
                          'https://moviewalker.jp/api/resizeimage/person/10/f6/10f68aa2ac2da8f5a6c5d858b2c44faa.jpg?w=690'),
                    ),
                    Dimensions.kHorizontalSpaceLarge,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(wallet[index].name!),
                        Text('${wallet[index].company!} / ${wallet[index].team!}'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
