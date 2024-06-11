import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:card_app/features/auth/presentation/screens/setting_screen.dart';
import 'package:card_app/features/wallet/presentation/provider/page_index_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/features/wallet/presentation/screens/add_wallet_screen.dart';
import 'package:card_app/features/wallet/presentation/screens/home_screen.dart';
import 'package:card_app/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/presentation/ss_bottom_navigation_bar.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  static String get route => '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBody();
  }
}

class TabBody extends ConsumerWidget {
  const TabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int pageIndex = ref.watch(pageIndexProvider);
    final UserInfoModel myData = ref.watch(authProvider);
    final List<UserInfoModel> wallet = ref.watch(walletProvider)!;

    if (wallet.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (pageIndex == 0) return const HomeScreen();
    if (pageIndex == 1) return const WalletScreen();
    if (pageIndex == 2) return const AddWalletScreen();
    if (pageIndex == 3) return const SettingScreen();

    return Container();
  }
}
