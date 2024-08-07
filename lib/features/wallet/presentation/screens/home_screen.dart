import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/features/wallet/presentation/widget/home_favorite_widget.dart';
import 'package:card_app/features/wallet/presentation/widget/home_top_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String get route => '/';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // 화면이 처음 로드될 때 wallet 데이터를 가져옵니다.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(walletProvider.notifier).get();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<FollowingEntity<UserInfoEntity>> followings = ref.watch(walletProvider);

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
