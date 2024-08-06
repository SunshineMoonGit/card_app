import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/wallet/presentation/widget/home_favorite_widget.dart';
import 'package:card_app/features/wallet/presentation/widget/home_top_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String get route => '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SsLayout(
      statusBarColor: context.colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          //@ 화면 상단 위젯
          const HomeTopWidget(),

          SliverToBoxAdapter(child: Dimensions.ssVerticalSpaceSmall),

          //@ 즐겨찾기 목록( 현재는 local 데이터만 가져옴 )
          const HomeFavoritesWidget(),
        ],
      ),
    );
  }
}
