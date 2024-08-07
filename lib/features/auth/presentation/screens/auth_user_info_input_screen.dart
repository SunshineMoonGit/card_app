import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/auth/presentation/widget/auth_user_info/ss_user_info_input_save_button_widget.dart';
import 'package:card_app/features/auth/presentation/widget/ss_render_bottom_modal.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_card_widget/ss_user_info_card_summary_edit.dart';
import 'package:card_app/features/auth/presentation/widget/ss_basic_info_widget.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/provider/controller_provider.dart';
import 'package:card_app/shared/provider/methods/app_method.dart';
import 'package:card_app/shared/widgets/ss_action_widget.dart';
import 'package:card_app/shared/widgets/ss_horizontal_padding_title_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthUserInfoInputScreen extends ConsumerStatefulWidget {
  static String get basePath => '/auth_user_info_input';

  static String route({required bool isSignUp}) => '$basePath?isSignUp=$isSignUp';

  final bool isSignUp;

  const AuthUserInfoInputScreen({
    super.key,
    this.isSignUp = false,
  });

  @override
  ConsumerState<AuthUserInfoInputScreen> createState() => _AuthUserInfoInputScreenState();
}

class _AuthUserInfoInputScreenState extends ConsumerState<AuthUserInfoInputScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(controllerProvider.notifier).initController<NewCardController>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final NewCardController? controllers = ref.watch(controllerProvider) as NewCardController?;

    if (controllers == null) {
      return Container();
    }

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    List<SsActionsModel> actions = [
      SsActionsModel(
        onTap: () {
          AppMethod(ref).wallet.addFollowing(controllers);
        },
        title: AppString.save,
        textStyle: context.textTheme.bodyMedium!,
      )
    ];

    return Stack(
      children: [
        SsLayout(
          appBarTitle: widget.isSignUp ? "My Info" : "New Card",
          bottomNavToggle: !widget.isSignUp,
          actions: SsActionsModel.text(actions),
          body: CustomScrollView(
            slivers: [
              if (!widget.isSignUp) const SsUserInfoCardSummaryEdit(),
              if (!widget.isSignUp) SliverToBoxAdapter(child: Dimensions.ssVerticalSpaceLarge),
              if (!widget.isSignUp) const SsHorizontalPaddingTitleWidget(title: AppString.basicInfo),
              SsBasicInfoInputWidget(formKey: formKey, controllers: controllers),
              SsUserInfoInputSaveButtonWidget<NewCardController>(
                  controllers: controllers, isSignUp: widget.isSignUp, formKey: formKey),
            ],
          ),
        ),
        const SsRenderBottomModal(),
      ],
    );
  }
}
