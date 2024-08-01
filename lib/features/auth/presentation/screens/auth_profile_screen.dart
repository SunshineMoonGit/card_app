import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/settings/presentation/screens/setting_screen.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_basic_widget.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_external_widget.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_card_widget/ss_user_info_card_widget.dart';
import 'package:card_app/shared/widgets/ss_action_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthProfileScreen extends ConsumerWidget {
  static String get route => '/auth_profile';

  const AuthProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserInfoEntity myInfo = ref.watch(authInfoProvider);

    final List<SsActionsModel> actions = [
      SsActionsModel(
        onTap: () => context.push(SettingScreen.route),
        iconData: Icons.settings,
      )
    ];

    return SsLayout(
      appBarTitle: AppString.profile,
      actions: SsActionsModel.icon(actions),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          //@ 배경 및 프로필
          SsUserInfoCardWidget(userData: myInfo),

          SliverToBoxAdapter(child: Dimensions.ssVerticalSpaceLarge),

          //@ 기본 정보
          SsUserInfoBasicWidget(userData: myInfo),

          SliverToBoxAdapter(child: Dimensions.ssVerticalSpaceLarge),

          //@ 추가 정보
          SsUserInfoExternalWidget(external: myInfo.external, canEdit: true),

          SliverToBoxAdapter(child: Dimensions.ssVerticalSpaceLarge),
        ],
      ),
    );
  }
}
