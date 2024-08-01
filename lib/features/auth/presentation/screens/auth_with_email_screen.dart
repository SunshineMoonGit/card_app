import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/class/text_form_field_model.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/provider/app_method.dart';
import 'package:card_app/shared/provider/text_controller_provider.dart';
import 'package:card_app/shared/widgets/ss_button_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:card_app/shared/widgets/text_form_field/ss_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthWithEmailScreen<T extends ControllerManager> extends ConsumerStatefulWidget {
  static String get route => '/auth_with_email';

  // final bool isSignUp;

  const AuthWithEmailScreen({
    super.key,
    // required this.isSignUp,
  });

  @override
  ConsumerState<AuthWithEmailScreen> createState() => _AuthWithEmailScreenState<T>();
}

class _AuthWithEmailScreenState<T extends ControllerManager> extends ConsumerState<AuthWithEmailScreen<T>> {
  late CType cType;
  @override
  void initState() {
    super.initState();
    // cType = isSignUp ? CType.signUp : CType.signIn;
    ref.read(controllerProvider.notifier).initController<T>();
    // if (cType == CType.signUp) {
    //   ref.read(textControllerProvider.notifier).initController<SignInController>();
    // } else {
    //   ref.read(textControllerProvider.notifier).initController<SignUpController>();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final T controllers = ref.watch(controllerProvider) as T;

    final bool isSignUp = T is SignUpController;

    List<TextFormFieldModel> textFormFields = [];
    // TextFormFieldModel.getByControllers(controllers: controllers, cType: cType, ref: ref);

    return SsLayout(
      bottomNavigationBar: Padding(
        padding: Dimensions.ssPaddingAll,
        child: SsButtonWidget(
          backgroundColor: context.colorScheme.primary,
          title: AppString.submit,
          // onTap: () => _signFunction(isSignUp, ref, controllers, context),
          onTap: () => AppMethod(ref).sign(isSignUp, controllers),
        ),
      ),
      appBarTitle: isSignUp ? AppString.signUp : AppString.signIn,
      centerTitle: true,
      body: Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...List.generate(
              textFormFields.length,
              (index) {
                return SsTextFormField(
                  validator: (val) => textFormFields[index].validator!(val!),
                  title: textFormFields[index].title,
                  obscureText: textFormFields[index].obscureText,
                  controller: textFormFields[index].controller,
                );
              },
            ),

            // 회원가입이 하고싶어요!
            if (!isSignUp)
              GestureDetector(
                onTap: () {
                  context.push(AuthWithEmailScreen.route, extra: true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SsText(
                    title: AppString.goSignUp,
                    style: context.textTheme.titleSmall!,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
