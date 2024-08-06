import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_basic_widget.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_external_widget.dart';
import 'package:card_app/features/auth/presentation/widget/shared/ss_user_info_card_widget/ss_user_info_card_widget.dart';
import 'package:card_app/shared/provider/methods/app_method.dart';
import 'package:card_app/shared/widgets/ss_button_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthUserInfoScreen extends StatelessWidget {
  final UserInfoEntity userData;

  static String get route => '/auth_user_info';

  const AuthUserInfoScreen({
    required this.userData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SsLayout(
      bottomNavToggle: false,
      appBarTitle: '',
      statusBarColor: context.colorScheme.secondary,
      actions: _action(),
      body: CustomScrollView(
        slivers: [
          SsUserInfoCardWidget(userData: userData),

          //@ 정보 & 관리, 수정
          SsUserInfoBasicWidget(userData: userData),

          //@ 추가 정보
          SsUserInfoExternalWidget(external: userData.external, canEdit: false),

          _deleteButton(userData.uid),
        ],
      ),
    );
  }

  Widget _deleteButton(String uid) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          return SsButtonWidget(
            title: '삭제',
            backgroundColor: Colors.red,
            onTap: () {
              AppMethod(ref).wallet.deleteFollowing(uid);
              context.pop();
            },
          );
        },
      ),
    );
  }

  List<Widget> _action() {
    return [
      Padding(
        padding: EdgeInsets.only(right: Dimensions.ssScreenWidth20),
        child: GestureDetector(
          child: const Icon(Icons.star_border),
        ),
      ),
    ];
  }
}
