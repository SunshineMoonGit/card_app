import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/auth/presentation/screens/auth_with_email_screen.dart';
import 'package:card_app/shared/widgets/ss_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SsAuthSelectLogInMethodsWidget extends StatelessWidget {
  const SsAuthSelectLogInMethodsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SsButtonWidget(
          icon: Icons.email,
          title: AppString.email,
          backgroundColor: Colors.grey,
          onTap: () => context.push(AuthWithEmailScreen.route, extra: false),
          textColor: Colors.white,
        ),
        SsButtonWidget(
          icon: Icons.email,
          title: 'Kakao',
          backgroundColor: Colors.yellow,
          onTap: () => context.push(AuthWithEmailScreen.route, extra: false),
          textColor: Colors.black,
        ),
        SsButtonWidget(
          icon: Icons.email,
          title: 'Google',
          backgroundColor: Colors.white,
          onTap: () => context.push(AuthWithEmailScreen.route, extra: false),
          textColor: Colors.black,
        ),
        Dimensions.ssVerticalSpaceLarge,
      ],
    );
  }
}
