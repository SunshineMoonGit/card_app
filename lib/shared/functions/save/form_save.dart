import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/commons/presentation/home_page.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/provider/app_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Save {
  static void textForms({
    required bool isSignUp,
    required ControllerManager controllers,
    required WidgetRef ref,
    required BuildContext context,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      final UserInfoEntity newData = UserInfoEntity();
      //! final UserInfoEntity newData = UserInfoEntity.fromController(controllers: controllers);

      if (isSignUp) {
        try {
          ref.read(authInfoProvider.notifier).update(newData);
          context.go(HomePage.route);
        } catch (e) {
          ssPrint(e, 'new_user_input_screen');
        }
      } else {
        AppMethod(ref).addFollowing(UpdateType.add, newData);
      }
    }
  }
}
