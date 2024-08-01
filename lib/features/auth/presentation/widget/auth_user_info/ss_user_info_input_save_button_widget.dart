import 'package:card_app/features/auth/presentation/widget/ss_save_button_widget.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/functions/save/form_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsUserInfoInputSaveButtonWidget extends ConsumerWidget {
  const SsUserInfoInputSaveButtonWidget({
    super.key,
    required this.controllers,
    required this.isSignUp,
    required this.formKey,
  });

  final ControllerManager controllers;
  final bool isSignUp;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: SsSaveButtonWidget(
        onTap: () {
          // controllers.save();
          // Save.textForms(
          //   controllers: controllers,
          //   isSignUp: isSignUp,
          //   ref: ref,
          //   context: context,
          //   formKey: formKey,
          // );
        },
      ),
    );
  }
}
