import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/page_index_provider.dart';
import 'package:card_app/shared/extensions/build_context_extensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopWidget extends ConsumerWidget {
  const HomeTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: HomeTopWidgetDelegate(
        authName: '${ref.watch(authInfoProvider).name}님',
        minSize: MediaQuery.of(context).padding.top + kToolbarHeight,
      ),
    );
  }
}

class HomeTopWidgetDelegate extends SliverPersistentHeaderDelegate {
  final double minSize;
  final String authName;

  HomeTopWidgetDelegate({
    required this.minSize,
    required this.authName,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = Dimensions.ssHomeTopWidgetHeight - shrinkOffset;
    final textFieldSize = MediaQuery.of(context).padding.top + 28.sp + 20.sp;

    final opacity =
        1.0 - (shrinkOffset / (Dimensions.ssHomeTopWidgetHeight - kToolbarHeight - textFieldSize - 50.h - 10.h));

    final bool isMinAppBar = appBarSize - 50.h < minSize;

    //@ 최소화
    if (isMinAppBar) {
      return Container(
        padding: EdgeInsets.fromLTRB(
          Dimensions.ssScreenWidth20,
          MediaQuery.of(context).padding.top,
          Dimensions.ssScreenWidth20,
          0,
        ),
        decoration: BoxDecoration(color: context.theme.colorScheme.primary),
        height: minSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SsText(
              title: 'wallet',
              style: context.textTheme.displaySmall!,
            ),
            Row(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.share),
                    );
                  },
                ),
                //   builder: (context) {
                //     return GestureDetector(
                //       onTap: () {},
                //       child: const Icon(Icons.share),
                //     );
                //   }
                // ),
                Dimensions.ssHorizontalSpaceSmall,
                Consumer(
                  builder: (context, ref, child) {
                    return GestureDetector(
                      onTap: () => ref.read(pageIndexProvider.notifier).changeIndex(2),
                      child: const Icon(Icons.add),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      );
    }
    //@ 최대화
    else {
      return SizedBox(
        height: Dimensions.ssHomeTopWidgetHeight,
        child: Stack(
          children: [
            //@ Top Widget Total Height Size
            SizedBox(
              height: appBarSize,
            ),

            //@ top widget background + 인삿말
            Container(
              height: appBarSize - 50.h,
              width: MediaQuery.sizeOf(context).width,
              padding: Dimensions.ssPaddingAll,
              decoration: BoxDecoration(
                boxShadow: [
                  if (context.theme.brightness == Brightness.light)
                    BoxShadow(
                      color: context.colorScheme.secondary,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 7),
                    ),
                ],
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimensions.ssBorderRadiusLarge)),
                color: context.theme.colorScheme.primary,
              ),

              //! Text 필드는 데이터를 받아와서 바꾸기
              child: _OpacityWidget(
                opacity: opacity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SsText(
                          title: 'hello',
                          style: context.textTheme.displayMedium!,
                          color: context.colorScheme.onPrimary,
                        ),
                      ],
                    ),
                    SsText(
                      title: authName,
                      style: context.textTheme.displaySmall!,
                      color: context.colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),

            //@ 공유, 추가 버튼
            Positioned(
              right: Dimensions.ssScreenWidth20,
              bottom: Dimensions.ssScreenHeight20 / 2,
              child: _OpacityWidget(
                opacity: opacity,
                child: Row(
                  children: [
                    //! 임시
                    Consumer(
                      builder: (context, ref, child) {
                        return _SsHomeTopWidgetButton(
                          onTap: () {
                            // ref.read(walletProvider.notifier).init();
                          },
                          icon: Icons.share,
                          title: 'share',
                        );
                      },
                    ),

                    Dimensions.ssHorizontalSpaceSmall,
                    Consumer(
                      builder: (context, ref, child) {
                        return _SsHomeTopWidgetButton(
                          onTap: () {
                            ref.read(pageIndexProvider.notifier).changeIndex(2);
                          },
                          icon: Icons.add,
                          title: 'add',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  double get maxExtent => Dimensions.ssHomeTopWidgetHeight;

  @override
  double get minExtent => minSize;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _SsHomeTopWidgetButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String title;

  const _SsHomeTopWidgetButton({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Dimensions.ssScreenWidth20 * 4,
        height: Dimensions.ssScreenWidth20 * 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusLarge),
          boxShadow: [
            //! BoxShadow widget?
            if (context.theme.brightness == Brightness.light)
              BoxShadow(
                color: context.colorScheme.secondary,
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 7),
              ),
          ],
          color: context.colorScheme.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: context.theme.colorScheme.onBackground,
            ),
            SsText(
              title: title,
              style: context.textTheme.bodyMedium!,
              color: context.colorScheme.onBackground,
            ),
          ],
        ),
      ),
    );
  }
}

class _OpacityWidget extends StatelessWidget {
  final double opacity;
  final Widget child;

  const _OpacityWidget({
    required this.opacity,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (opacity > 0) {
      return Opacity(opacity: opacity, child: child);
    } else {
      return const SizedBox();
    }
  }
}
