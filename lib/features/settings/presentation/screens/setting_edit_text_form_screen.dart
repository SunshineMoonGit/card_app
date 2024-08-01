import 'package:card_app/config/app/app_setting.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:card_app/shared/widgets/text_form_field/ss_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingEditTextFormScreen extends ConsumerStatefulWidget {
  static String get route => '/setting_edit_text_form';

  final AppSetting setting;

  const SettingEditTextFormScreen({
    super.key,
    required this.setting,
  });

  @override
  ConsumerState<SettingEditTextFormScreen> createState() => _EditSettingTextScreenState();
}

class _EditSettingTextScreenState extends ConsumerState<SettingEditTextFormScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.setting.detail);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserInfoEntity oldValue = ref.read(authInfoProvider);

    return SsLayout(
      appBarTitle: '',
      bottomNavToggle: false,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimensions.ssPaddingHorizontal,
              child: SsTextFormField(
                validator: (val) {
                  return null;
                },
                title: widget.setting.title,
                controller: controller,
              ),
            ),
          ),
          _renderComplete(oldValue),
        ],
      ),
    );
  }

  SliverToBoxAdapter _renderComplete(UserInfoEntity oldValue) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: ElevatedButton(
          onPressed: () {
            //! ref.read(authInfoProvider.notifier).update(
            //       oldValue.typeCopyWith(
            //         type: widget.setting.title,
            //         value: controller.text,
            //       ),
            //     );
            context.pop();
          },
          child: SsText(
            title: AppString.modify,
            style: context.textTheme.headlineSmall!,
            color: context.colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
