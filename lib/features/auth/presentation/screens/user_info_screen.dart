import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/presentation/widget/ss_user_info_card_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoScreen extends StatelessWidget {
  final UserInfoModel userData;

  static String get route => '/card_info';

  const UserInfoScreen({
    required this.userData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double standardCardWidth = 1050;
    const double standardCardHeight = 650;

    final double cardWidth = MediaQuery.sizeOf(context).width - (20.h * 2);

    final double cardRatio = cardWidth / standardCardWidth;

    final double cardHeight = standardCardHeight * cardRatio;

    final List<UserInfoWithIcon> userInfoWithIcon = UserInfoModel.infoWithIcon(data: userData);

    //1050 width
    //600 height
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          // pop and more(dropBox)
          // const SsUserInfoAppBar(
          //   cardImage: 'https://picsum.photos/200/300',
          //   // cards: cards,
          // ),

          // Info Page Card Content
          // OnTap -> change blur
          SsUserInfoCardSummary(
            cardWidth: cardWidth,
            cardHeight: cardHeight,
            userData: userData,
          ),

          SliverToBoxAdapter(child: Dimensions.kVerticalSpaceLarge),

          // Basic Information Title
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimensions.kPaddingHorizontalLarge,
              child: Text(
                '기본 정보',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),

          SliverToBoxAdapter(child: Dimensions.kVerticalSpaceLarge),

          // Basic Information Detail
          SliverList.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: Dimensions.kPaddingHorizontalLarge,
                child: Row(
                  children: [
                    Dimensions.kHorizontalSpaceSmaller,
                    userInfoWithIcon[index].icon,
                    Dimensions.kHorizontalSpaceSmaller,
                    Text(userInfoWithIcon[index].info),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: const Divider(),
              );
            },
            itemCount: userInfoWithIcon.length,
          ),

          // SliverToBoxAdapter(
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount,
          //     itemBuilder: itemBuilder,
          //   ),
          // ),
        ],
      ),
    );
  }
}
