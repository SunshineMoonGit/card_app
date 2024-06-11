import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/presentation/screens/user_info_screen.dart';
import 'package:card_app/features/wallet/presentation/screens/add_wallet_screen.dart';
import 'package:card_app/features/wallet/presentation/screens/home_page.dart';
import 'package:card_app/features/wallet/presentation/screens/home_screen.dart';
import 'package:card_app/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final redirectProvider = _RedirectNotifier(ref: ref);

  return GoRouter(
    initialLocation: HomePage.route,
    routes: redirectProvider._routes,
    redirect: redirectProvider._redirectLogic,
    refreshListenable: redirectProvider,
  );
});

class _RedirectNotifier extends ChangeNotifier {
  final Ref ref;

  _RedirectNotifier({required this.ref});

  Future<String?> _redirectLogic(_, GoRouterState state) async {
    return null;
    // }

    // return null;
  }

  List<GoRoute> get _routes => [
        // // Splash
        // GoRoute(path: SplashPage.route, builder: (context, state) => const SplashPage()),

        // Root Page
        GoRoute(path: HomePage.route, builder: (context, state) => const HomePage()),
        GoRoute(
            path: UserInfoScreen.route,
            builder: (context, state) => UserInfoScreen(
                  userData: state.extra as UserInfoModel,
                )),
        GoRoute(
            path: DisplayPictureScreen.route,
            builder: (context, state) => DisplayPictureScreen(
                  imagePath: state.extra as String,
                )),
      ];
}
