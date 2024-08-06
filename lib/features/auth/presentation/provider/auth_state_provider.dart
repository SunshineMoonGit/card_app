import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateProviderNotifier, AuthState>((ref) {
  return AuthStateProviderNotifier(ref);
});

class AuthStateProviderNotifier extends StateNotifier<AuthState> {
  final Ref ref;

  AuthStateProviderNotifier(this.ref) : super(AuthState.initial);

  Future<void> check() async {
    final UserInfoEntity authInfo = ref.read(authInfoProvider);
    // ssPrint("check", 'auth_state_provider');

    if (authInfo.uid == '') {
      state = AuthState.unauthenticated;
      return;
    }

    if (authInfo.uid != '') {
      if (authInfo.name == '') {
        state = AuthState.authenticatedButIncomplete;
      } else {
        state = AuthState.authenticated;
      }
    }

    // ssPrint(state, 'auth_state_provider');
  }

  void change(AuthState authState) {
    state = authState;
  }
}
