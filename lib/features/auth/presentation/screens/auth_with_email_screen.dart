import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/class/text_form_field_model.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/provider/methods/app_method.dart';
import 'package:card_app/shared/provider/controller_provider.dart';
import 'package:card_app/shared/widgets/ss_button_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:card_app/shared/widgets/text_form_field/ss_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthWithEmailScreen extends ConsumerStatefulWidget {
  static String get route => '/auth_with_email';

  final bool isSignUp;

  const AuthWithEmailScreen({
    super.key,
    required this.isSignUp,
  });

  @override
  ConsumerState<AuthWithEmailScreen> createState() => _AuthWithEmailScreenState();
}

class _AuthWithEmailScreenState<T extends ControllerManager> extends ConsumerState<AuthWithEmailScreen> {
  late CType cType;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isSignUp) {
        ref.read(controllerProvider.notifier).initController<SignUpController>();
      } else {
        ref.read(controllerProvider.notifier).initController<SignInController>();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final T controller = ref.watch(controllerProvider) as T;

    if (controller is EmptyController) {
      return const CircularProgressIndicator();
    }

    final List<TextFormFieldModel> textFormFields = TextFormFieldModel.getByControllers(controllers: controller);

    return SsLayout(
      leading: () => _onPop(widget.isSignUp, context),
      leadingToggle: true,
      bottomNavigationBar: _renderButton(controller),
      appBarTitle: controller.title,
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
            if (!widget.isSignUp) const GoToSignUp()
          ],
        ),
      ),
    );
  }

  void _onPop(bool isSignUp, BuildContext context) {
    if (isSignUp) {
      ref.read(controllerProvider.notifier).initController<SignInController>();
      context.pop();
    } else {
      context.pop();
    }
  }

  Widget _renderButton(T controller) {
    return Padding(
      padding: Dimensions.ssPaddingVertical,
      child: SsButtonWidget(
        backgroundColor: context.colorScheme.primary,
        title: AppString.submit,
        onTap: () {
          if (controller is SignUpController) {
            print('dd');
            AppMethod(ref).auth.signUp(controller);
          } else if (controller is SignInController) {
            AppMethod(ref).auth.signIn(controller);
          }
        },
      ),
    );
  }
}

class GoToSignUp extends ConsumerWidget {
  const GoToSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // SignUpController controller = ref.read(controllerProvider.notifier).initController<SignUpController>();
        context.push(AuthWithEmailScreen.route, extra: true);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SsText(
          title: AppString.goSignUp,
          style: context.textTheme.titleSmall!,
        ),
      ),
    );
  }
}
