import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/class/text_form_field_model.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:card_app/shared/widgets/text_form_field/ss_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SsBasicInfoInputWidget extends ConsumerWidget {
  final ControllerManager controllers;
  final GlobalKey formKey;

  const SsBasicInfoInputWidget({
    super.key,
    required this.controllers,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TextFormFieldModel> textFormFields = TextFormFieldModel.getByControllers(controllers: controllers);

    return SliverToBoxAdapter(
      child: Form(
        key: formKey,
        child: Column(
          children: _renderTextFormField(
            context: context,
            textFormFields: textFormFields,
          ),
        ),
      ),
    );
  }

  List<Widget> _renderTextFormField({
    required List<TextFormFieldModel> textFormFields,
    required BuildContext context,
  }) {
    return List.generate(
      textFormFields.length,
      (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SsText(
                title: textFormFields[index].title,
                style: context.textTheme.bodySmall!,
                color: context.colorScheme.onSecondary,
              ),
              Dimensions.ssVerticalSpaceSmall,
              SsTextFormField(
                validator: (val) {
                  return null;
                },
                controller: textFormFields[index].controller,
              ),
            ],
          ),
        );
      },
    );
  }
}
