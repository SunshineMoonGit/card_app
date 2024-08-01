import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/widget/ss_info_with_icon_widget.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_render_padding_sliver_widget.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';

// # auth_profile_screen
// # auth_user_info_screen

class SsUserInfoBasicWidget extends StatelessWidget {
  final UserInfoEntity userData;

  const SsUserInfoBasicWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return SsRenderPaddingSliverWidget(
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
        ),
        padding: Dimensions.ssPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //@ 닉네임 및 이름
            SsText(
              title: 'basicInfo',
              style: context.textTheme.bodyLarge!,
              color: context.colorScheme.onTertiary,
            ),

            //@ 기본 정보 리스트
            SsInfoWithIconWidget(
              icon: Icons.person,
              title: userData.name == '' ? AppString.name : userData.name,
            ),
            SsInfoWithIconWidget(
              icon: Icons.location_on,
              title: userData.company == '' ? AppString.company : userData.company,
            ),
            SsInfoWithIconWidget(
              icon: Icons.people,
              title: userData.team == '' ? AppString.team : userData.team,
            ),
            SsInfoWithIconWidget(
              icon: Icons.phone,
              title: userData.phone == '' ? AppString.phone : userData.phone,
            ),
            SsInfoWithIconWidget(
              icon: Icons.email,
              title: userData.email == '' ? AppString.email : userData.email,
            ),
            SsInfoWithIconWidget(
              icon: Icons.fax,
              title: userData.fax == '' ? AppString.fax : userData.fax,
            ),
          ],
        ),
      ),
    );
  }
}
