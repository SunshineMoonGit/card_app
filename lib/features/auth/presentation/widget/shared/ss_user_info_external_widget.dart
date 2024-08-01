import 'package:card_app/config/app/app_path.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/class/ss_external_model.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_render_padding_sliver_widget.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// # auth_profile_screen
// # auth_user_info_screen

class SsUserInfoExternalWidget extends StatelessWidget {
  final List<SsExternalModel> external;
  final bool canEdit;
  final bool isMyProfile;

  const SsUserInfoExternalWidget({
    super.key,
    required this.external,
    required this.canEdit,
    this.isMyProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    // List<SsExternalModel> externalDummy = [
    //   SsExternalModel(
    //     platform: AppPath.youtube,
    //     key: 'woowakgood',
    //   ),
    //   SsExternalModel(
    //     platform: AppPath.x,
    //     key: 'elonmusk',
    //   ),
    //   SsExternalModel(
    //     platform: AppPath.github,
    //     key: 'SunshineMoonGit',
    //   ),
    //   SsExternalModel(
    //     platform: AppPath.instagram,
    //     key: 'gosegu_official',
    //   ),
    //   SsExternalModel(
    //     platform: AppPath.facebook,
    //     key:
    //         'https://ko-kr.facebook.com/people/%EC%9C%A0%EB%AA%85%EC%A3%BC/pfbid02iVQX3ZhiFLZiZABjrzy43JYLXpYEaGbdS2WtJmU9jHPWwXxhhBZbaUjcFFHSwvuWl/',
    //   ),
    //   SsExternalModel(
    //     platform: AppPath.soundCloud,
    //     key: 'viichan6',
    //   ),
    //   SsExternalModel(
    //     platform: AppPath.none,
    //     key: 'https://nothing.com/viichan6',
    //   ),
    // ];

    return SsRenderPaddingSliverWidget(
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
        ),
        padding: Dimensions.ssPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SsText(
                  title: AppString.external,
                  style: context.textTheme.bodyLarge!,
                  color: context.colorScheme.onTertiary,
                ),
                // if (canEdit)
                //   GestureDetector(
                //     onTap: () {
                //       ssPrint('등록사이트로 route', 'ss_user_extra_info_widget');
                //     },
                //     child: SsText(
                //       title: '등록',
                //       style: context.textTheme.bodySmall!,
                //       color: context.colorScheme.onTertiary,
                //     ),
                //   ),
              ],
            ),
            SizedBox(height: 10.h),
            // if (extra == null)
            // if (extra == null)
            //   Center(
            //     child: SsText(
            //       title: AppString.registerYourLinks,
            //       style: context.textTheme.bodySmall!,
            //       textAlign: TextAlign.center,
            //       color: context.colorScheme.onSurface,
            //     ),
            //   ),
            if (external.isEmpty)
              const SsText(
                title: '해당 유저가\n연결한 링크가 없습니다.',
              ),
            if (external.isNotEmpty)
              Builder(
                builder: (context) {
                  int itemCount = external.length; // 예시 아이템 개수
                  double itemWidth = 100; // 각 아이템의 너비
                  double itemHeight = 100; // 각 아이템의 높이
                  double spacing = 10; // 아이템 간의 간격

                  int crossAxisCount = (MediaQuery.of(context).size.width / (itemWidth + spacing)).floor();
                  double gridHeight = (itemHeight + spacing) * ((itemCount / crossAxisCount).ceil());

                  return SizedBox(
                    height: gridHeight,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: itemWidth + spacing,
                        mainAxisSpacing: spacing,
                        crossAxisSpacing: spacing,
                        childAspectRatio: itemWidth / itemHeight,
                      ),
                      itemCount: itemCount,
                      itemBuilder: (BuildContext context, int index) {
                        SsExternalModel data = SsExternalModel.renderPlatform(external[index]);
                        return GestureDetector(
                          onTap: () => data.onTap!(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
                              color: Colors.white,
                            ),
                            width: 20,
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SvgPicture.asset(
                                height: 5,
                                width: 5,
                                '${AppPath.localSvg}${data.platform}.svg',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
