import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/settings/presentation/provider/custom_setting_provider.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/provider/controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthMethod {
  final WidgetRef ref;

  AuthMethod(this.ref);

  Future<void> signUp(SignUpController controllers) async {
    print('''${controllers.loginEmailController.text},
      ${controllers.loginPwController.text}''');
    await ref.read(authInfoProvider.notifier).signUpWithEmail(
          controllers.loginEmailController.text,
          controllers.loginPwController.text,
        );
  }

  Future<void> signOut() async {
    // authInfo 지우기
    ref.read(customSettingProvider.notifier).clear();
    ref.read(authInfoProvider.notifier).clear();
  }

  Future<void> signIn(SignInController controllers) async {
    print('''${controllers.loginEmailController.text},
      ${controllers.loginPwController.text}''');
    await ref.read(authInfoProvider.notifier).signInWithEmail(
          controllers.loginEmailController.text,
          controllers.loginPwController.text,
        );
  }

  Future<void> update(NewCardController controllers) async {
    final NewCardController controller = ref.read(controllerProvider.notifier).submit(controllers);
    final UserInfoEntity data = UserInfoEntity.fromController(controller);
    await ref.read(authInfoProvider.notifier).update(data);
  }
}
