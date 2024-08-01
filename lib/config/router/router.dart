import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_setting.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:card_app/features/auth/presentation/screens/auth_with_email_screen.dart';
import 'package:card_app/features/commons/presentation/full_image_viewer_screen.dart';
import 'package:card_app/features/auth/presentation/screens/auth_profile_screen.dart';
import 'package:card_app/features/auth/presentation/screens/auth_select_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_language_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_screen.dart';
import 'package:card_app/features/auth/presentation/screens/auth_user_info_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_auth_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_edit_text_form_screen.dart';
import 'package:card_app/features/settings/presentation/screens/setting_display_screen.dart';
import 'package:card_app/features/commons/presentation/splash_screen.dart';
import 'package:card_app/features/auth/presentation/screens/auth_user_info_input_screen.dart';
import 'package:card_app/features/commons/presentation/home_page.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final redirectProvider = _RedirectNotifier(ref);

  return GoRouter(
    initialLocation: SplashScreen.route,
    routes: redirectProvider._routes,
    redirect: redirectProvider._redirectLogic,
    refreshListenable: redirectProvider,
  );
});

class _RedirectNotifier extends ChangeNotifier {
  final Ref ref;

  _RedirectNotifier(this.ref) : super() {
    ref.listen<AuthState>(
      authStateProvider,
      (previous, next) {
        if (previous != next) {
          ssPrint("Redirect", 'router');
          // _currentAuthState = next;
          notifyListeners();
        }
      },
    );
  }

  Future<String?> _redirectLogic(_, GoRouterState state) async {
    final AuthState authState = await ref.read(authStateProvider);

    if (state.uri.toString() == SplashScreen.route) {
      if (authState == AuthState.logIn) {
        ssPrint('login', 'router');
        return HomePage.route;
      } else if (authState == AuthState.logOut) {
        ssPrint('logOut', 'router');
        return AuthSelectScreen.route;
      }
    }

    if (authState == AuthState.logOut && state.uri.toString() != AuthSelectScreen.route) {
      return SplashScreen.route;
    }

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
            path: SplashScreen.route,
            builder: (context, state) =>
                SplashScreen(settingUpdate: state.extra == null ? false : state.extra as bool)),
        GoRoute(path: AuthSelectScreen.route, builder: (context, state) => const AuthSelectScreen()),
        GoRoute(
            path: AuthWithEmailScreen.route,
            builder: (context, state) {
              if (state.extra as bool) {
                return const AuthWithEmailScreen<SignUpController>();
              } else {
                return const AuthWithEmailScreen<SignInController>();
              }
            }
            // AuthWithEmailScreen<SignInController>(
            //   isSignUp: state.extra as bool,
            // ),
            ),
        // HomePage
        GoRoute(path: HomePage.route, builder: (context, state) => const HomePage()),

        // Wallet
        GoRoute(
            path: AuthUserInfoScreen.route,
            builder: (context, state) => AuthUserInfoScreen(userData: state.extra as UserInfoEntity)),
        GoRoute(
          path: FullImageViewerScreen.route,
          builder: (context, state) => FullImageViewerScreen(imageUrl: state.extra as String),
        ),
        // Add Wallet
        GoRoute(
          path: AuthUserInfoInputScreen.route,
          builder: (context, state) {
            if (state.extra as bool) {
              return const AuthUserInfoInputScreen<SignUpController>();
            } else {
              return const AuthUserInfoInputScreen<NewCardController>();
            }
          },
        ),

        // My Page
        GoRoute(path: AuthProfileScreen.route, builder: (context, state) => const AuthProfileScreen()),
        GoRoute(path: SettingScreen.route, builder: (context, state) => const SettingScreen()),

        // Setting
        GoRoute(path: SettingAuthScreen.route, builder: (context, state) => const SettingAuthScreen()),
        GoRoute(path: SettingLanguageScreen.route, builder: (context, state) => const SettingLanguageScreen()),
        GoRoute(path: SettingDisplayScreen.route, builder: (context, state) => const SettingDisplayScreen()),
        GoRoute(
            path: SettingEditTextFormScreen.route,
            builder: (context, state) => SettingEditTextFormScreen(
                  setting: state.extra as AppSetting,
                )),
      ];
}
