import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerProvider = StateNotifierProvider<ControllerProviderNotifier, ControllerManager?>((ref) {
  return ControllerProviderNotifier(ref);
});

class ControllerProviderNotifier extends StateNotifier<ControllerManager?> {
  final Ref ref;

  ControllerProviderNotifier(this.ref) : super(null);

  void initController<T extends ControllerManager>() {
    state?.dispose();
    T controller = ControllerFactory.create<T>();
    state = controller;
  }

  Future<void> save<T extends ControllerManager>(T controller, [bool isSignUp = false]) async {
    controller.map(
      signIn: (value) {
        // 로그인
      },
      signUp: (value) {
        // 회원가입
      },
      newCard: (value) async {
        final UserType userType = ref.read(authInfoProvider).userType;
        final UserInfoEntity newData = UserInfoEntity.fromController(value);
        if (isSignUp) {
          // 내 정보 업데이트
          await ref.read(authInfoProvider.notifier).update(newData);
        } else {
          // wallet 추가
          await ref.read(walletProvider.notifier).addLocal(newData, userType);
        }
      },
    );
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}

class ControllerFactory {
  static T create<T extends ControllerManager>() {
    switch (T) {
      case const (SignInController):
        return SignInController(
          loginEmailController: TextEditingController(),
          loginPwController: TextEditingController(),
        ) as T;
      case const (SignUpController):
        return SignUpController(
          loginEmailController: TextEditingController(),
          loginPwController: TextEditingController(),
          login2PwController: TextEditingController(),
        ) as T;
      case const (NewCardController):
        return NewCardController(
          nameController: TextEditingController(),
          cardImageController: '',
          emailController: TextEditingController(),
          teamController: TextEditingController(),
          companyController: TextEditingController(),
          phoneController: TextEditingController(),
          faxController: TextEditingController(),
        ) as T;
      default:
        throw Exception("Unsupported controller type");
    }
  }
}
