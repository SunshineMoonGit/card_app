import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/functions/validator/ss_validator.dart';

part 'text_form_field_model.freezed.dart';

@freezed
class TextFormFieldModel with _$TextFormFieldModel {
  const factory TextFormFieldModel({
    Icon? icon,
    required String title,
    required TextEditingController controller,
    String? Function(String val)? validator,
    List<TextInputFormatter>? inputFormatters,
    @Default(false) bool obscureText,
  }) = _TextFormFieldModel;

  static List<TextFormFieldModel> getByControllers<T extends ControllerManager>({required T controllers}) {
    if (controllers is SignInController) return _login(controllers);
    if (controllers is SignUpController) return _signUp(controllers);
    if (controllers is NewCardController) return _newCard(controllers);

    return [];
  }
}

List<TextFormFieldModel> _login(SignInController controllers) {
  return [
    TextFormFieldModel(
      title: 'email',
      controller: controllers.loginEmailController,
      validator: (val) {
        return SsValidator.containNumber(val);
      },
    ),
    TextFormFieldModel(
      title: 'pw',
      controller: controllers.loginPwController,
      validator: (val) {
        return SsValidator.containNumber(val);
      },
    ),
  ];
}

List<TextFormFieldModel> _signUp(SignUpController controllers) {
  return [
    TextFormFieldModel(
      title: 'email',
      controller: controllers.loginEmailController,
      validator: (val) {
        return null;

        // return SsValidator.containNumber(val);
      },
    ),
    TextFormFieldModel(
      title: 'pw',
      controller: controllers.loginPwController,
      validator: (val) {
        return null;

        // return SsValidator.containNumber(val);
      },
    ),
    TextFormFieldModel(
      title: 'pw check',
      controller: controllers.login2PwController,
      obscureText: true,
      validator: (val) {
        return null;

        // return SsValidator.containNumber(val);
      },
    ),
  ];
}

List<TextFormFieldModel> _newCard(NewCardController controllers) {
  return [
    TextFormFieldModel(
      icon: const Icon(Icons.person),
      title: 'name',
      controller: controllers.nameController,
      validator: (val) {
        return SsValidator.containNumber(val);
      },
    ),
    TextFormFieldModel(
      icon: const Icon(Icons.email),
      title: 'email',
      controller: controllers.emailController,
      validator: (val) {
        if (val.isNotEmpty) {
          return SsValidator.email(val);
        }
        return null;
      },
    ),
    TextFormFieldModel(
      icon: const Icon(Icons.people),
      title: 'team',
      controller: controllers.teamController,
      validator: (val) {
        return null;
      },
    ),
    TextFormFieldModel(
      icon: const Icon(Icons.apartment),
      title: 'company',
      controller: controllers.companyController,
      validator: (val) {
        return null;
      },
    ),
    TextFormFieldModel(
      icon: const Icon(Icons.phone),
      title: 'phone',
      controller: controllers.phoneController,
      validator: (val) {
        return null;
      },
      inputFormatters: [],
    ),
    TextFormFieldModel(
      icon: const Icon(Icons.fax),
      title: 'fax',
      controller: controllers.faxController,
      validator: (val) {
        return null;
      },
    ),
  ];
}
