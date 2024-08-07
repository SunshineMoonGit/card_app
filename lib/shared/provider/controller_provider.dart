import 'package:card_app/shared/class/controller_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerProvider = StateNotifierProvider<ControllerProviderNotifier, ControllerManager>((ref) {
  return ControllerProviderNotifier(ref);
});

class ControllerProviderNotifier extends StateNotifier<ControllerManager> {
  final Ref ref;

  ControllerProviderNotifier(this.ref) : super(const ControllerManager.empty());

  void initController<T extends ControllerManager>() {
    state.dispose();
    T controller = ControllerFactory.create<T>();

    state = controller;
  }

  T submit<T extends ControllerManager>(T controller) {
    return controller;
  }

  @override
  void dispose() {
    state = const ControllerManager.empty();
    super.dispose();
  }
}

class ControllerFactory {
  static T create<T extends ControllerManager>() {
    switch (T) {
      case const (EmptyController):
        return const EmptyController() as T;
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
