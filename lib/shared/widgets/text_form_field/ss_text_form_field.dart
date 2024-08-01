import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SsTextFormField extends StatelessWidget {
  // 배경색
  final Color? fillColor;
  // 아이콘
  final Icon? prefixIcon;
  // 힌트
  final String? hintText;
  // 타이틀
  final String? title;
  // 비밀번호
  final bool obscureText;
  // 텍스트 콘트롤러
  final TextEditingController controller;
  // 검증
  final String? Function(String?) validator;
  // 포맷
  final List<TextInputFormatter>? inputFormatters;

  const SsTextFormField({
    super.key,
    this.fillColor,
    required this.controller,
    this.prefixIcon,
    this.hintText,
    this.title,
    this.obscureText = false,
    required this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: Dimensions.ssPaddingAll / 2,
            child: SsText(
              title: title!,
              style: context.textTheme.titleLarge!,
              color: context.colorScheme.onSurface,
            ),
          ),
        Form(
          child: TextFormField(
            inputFormatters: inputFormatters,
            validator: validator,
            style: context.textTheme.bodyMedium!.copyWith(color: context.colorScheme.onSurface),
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: fillColor ?? context.colorScheme.secondary,
              prefixIcon: prefixIcon,
              enabledBorder: _ssInputBorder(),
              focusedBorder: _ssInputBorder(),
              errorBorder: _ssInputBorder(),
              focusedErrorBorder: _ssInputBorder(),
              errorStyle: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder _ssInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusSmall),
    borderSide: BorderSide.none,
  );
}
