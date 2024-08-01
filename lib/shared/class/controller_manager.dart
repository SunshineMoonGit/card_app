import 'package:card_app/config/app/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'controller_manager.freezed.dart';

@freezed
class ControllerManager with _$ControllerManager {
  const ControllerManager._();

  const factory ControllerManager.signIn({
    required TextEditingController loginEmailController,
    required TextEditingController loginPwController,
  }) = SignInController;

  const factory ControllerManager.signUp({
    required TextEditingController loginEmailController,
    required TextEditingController loginPwController,
    required TextEditingController login2PwController,
  }) = SignUpController;

  const factory ControllerManager.newCard({
    required TextEditingController nameController,
    required String cardImageController,
    required TextEditingController emailController,
    required TextEditingController teamController,
    required TextEditingController companyController,
    required TextEditingController phoneController,
    required TextEditingController faxController,
  }) = NewCardController;

  String get appBarTitle {
    return map(
      signIn: (_) => AppString.signIn,
      signUp: (_) => AppString.signUp,
      newCard: (_) => AppString.newCardAdd,
    );
  }

  void dispose() {
    map(
      signIn: (value) {
        value.loginEmailController.dispose();
        value.loginPwController.dispose();
      },
      signUp: (value) {
        value.loginEmailController.dispose();
        value.loginPwController.dispose();
        value.login2PwController.dispose();
      },
      newCard: (value) {
        value.nameController.dispose();
        value.emailController.dispose();
        value.teamController.dispose();
        value.companyController.dispose();
        value.phoneController.dispose();
        value.faxController.dispose();
      },
    );
  }
}
