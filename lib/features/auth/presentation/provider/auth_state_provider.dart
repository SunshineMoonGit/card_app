import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateProviderNotifier, AuthState>((ref) {
  final UserInfoEntity authInfo = ref.watch(authInfoProvider);
  return AuthStateProviderNotifier(authInfo);
});

class AuthStateProviderNotifier extends StateNotifier<AuthState> {
  final UserInfoEntity authInfo;

  AuthStateProviderNotifier(this.authInfo) : super(AuthState.check);

  Future<void> check() async {
    ssPrint("check", 'auth_state_provider');

    state = AuthState.logIn;

    ssPrint(state, 'auth_state_provider');
  }
}
