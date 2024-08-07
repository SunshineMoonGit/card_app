import 'package:card_app/features/auth/presentation/screens/auth_profile_screen.dart';
import 'package:card_app/features/wallet/presentation/provider/page_index_provider.dart';
import 'package:card_app/features/auth/presentation/screens/auth_user_info_input_screen.dart';
import 'package:card_app/features/wallet/presentation/screens/home_screen.dart';
import 'package:card_app/features/wallet/presentation/screens/wallet_screen.dart';
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

    if (pageIndex == 0) return const HomeScreen();
    if (pageIndex == 1) return const WalletScreen();
    if (pageIndex == 2) {
      return const AuthUserInfoInputScreen(isSignUp: false);
    }
    if (pageIndex == 3) return const AuthProfileScreen();

    return Container();
  }
}
