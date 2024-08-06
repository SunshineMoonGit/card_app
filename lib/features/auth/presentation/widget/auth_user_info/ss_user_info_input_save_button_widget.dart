import 'package:card_app/features/auth/presentation/widget/ss_save_button_widget.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/provider/methods/app_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsUserInfoInputSaveButtonWidget<T extends ControllerManager> extends ConsumerWidget {
  const SsUserInfoInputSaveButtonWidget({
    super.key,
    required this.controllers,
    required this.isSignUp,
    required this.formKey,
  });

  final NewCardController controllers;
  final bool isSignUp;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: SsSaveButtonWidget(
        onTap: () async {
          if (isSignUp) {
            await AppMethod(ref).auth.update(controllers);
          } else {
            await AppMethod(ref).wallet.addFollowing(controllers);
          }
        },
      ),
    );
  }
}
 // controllers.save();
          // Save.textForms(
          //   controllers: controllers,
          //   isSignUp: isSignUp,
          //   ref: ref,
          //   context: context,
          //   formKey: formKey,
          // );