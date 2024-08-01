import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/auth/presentation/widget/auth_user_info/ss_user_info_input_save_button_widget.dart';
import 'package:card_app/features/auth/presentation/widget/ss_render_bottom_modal.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_card_widget/ss_user_info_card_summary_edit.dart';
import 'package:card_app/features/auth/presentation/widget/ss_basic_info_widget.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/functions/save/form_save.dart';
import 'package:card_app/shared/provider/text_controller_provider.dart';
import 'package:card_app/shared/widgets/ss_action_widget.dart';
import 'package:card_app/shared/widgets/ss_horizontal_padding_title_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthUserInfoInputScreen<T extends ControllerManager> extends ConsumerStatefulWidget {
  static String get route => '/auth_user_info_input';

  final bool isSignUp;

  const AuthUserInfoInputScreen({
    super.key,
    this.isSignUp = false,
  });

  @override
  ConsumerState<AuthUserInfoInputScreen> createState() => _AuthUserInfoInputScreenState<T>();
}

class _AuthUserInfoInputScreenState<T extends ControllerManager> extends ConsumerState<AuthUserInfoInputScreen<T>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(controllerProvider.notifier).initController<T>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final T? controllers = ref.watch(controllerProvider) as T?;

    if (controllers == null) {
      return Container();
    }

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    List<SsActionsModel> actions = [
      SsActionsModel(
        onTap: () => ref.read(controllerProvider.notifier).save<T>(controllers),
        title: AppString.save,
        textStyle: context.textTheme.bodyMedium!,
      )
    ];

    return Stack(
      children: [
        SsLayout(
          appBarTitle: controllers.appBarTitle,
          bottomNavToggle: !widget.isSignUp,
          actions: SsActionsModel.text(actions),
          body: CustomScrollView(
            slivers: [
              const SsUserInfoCardSummaryEdit(),
              SliverToBoxAdapter(child: Dimensions.ssVerticalSpaceLarge),
              const SsHorizontalPaddingTitleWidget(title: AppString.basicInfo),
              SsBasicInfoInputWidget(formKey: formKey, controllers: controllers),
              SsUserInfoInputSaveButtonWidget(controllers: controllers, isSignUp: widget.isSignUp, formKey: formKey),
            ],
          ),
        ),
        const SsRenderBottomModal(),
      ],
    );
  }
}
