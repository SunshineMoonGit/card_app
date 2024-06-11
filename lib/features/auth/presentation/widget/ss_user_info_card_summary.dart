import 'dart:ui';

import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:flutter/material.dart';

class SsUserInfoCardSummary extends StatefulWidget {
  const SsUserInfoCardSummary({
    super.key,
    required this.cardWidth,
    required this.cardHeight,
    required this.userData,
  });

  final double cardWidth;
  final double cardHeight;
  final UserInfoModel userData;

  @override
  State<SsUserInfoCardSummary> createState() => _SsUserInfoCardSummaryState();
}

class _SsUserInfoCardSummaryState extends State<SsUserInfoCardSummary> {
  bool cardToggle = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.kPaddingHorizontalLarge,
        child: GestureDetector(
          onTap: () {
            setState(() {
              cardToggle = !cardToggle;
            });
          },
          child: Stack(
            children: [
              // Business Card Image + blur 효과
              Container(
                width: widget.cardWidth,
                height: widget.cardHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.sizeSmall),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.sizeSmall),
                  child: cardToggle
                      ? Image.network(
                          'https://picsum.photos/200/300',
                          fit: BoxFit.cover,
                        )
                      : ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Image.network(
                            'https://picsum.photos/200/300',
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),

              // Business Card Summary + opacity
              Container(
                padding: Dimensions.kPaddingAllLarge,
                width: widget.cardWidth,
                height: widget.cardHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.sizeSmall),
                  color: Colors.white.withOpacity(cardToggle ? 0 : .5),
                ),

                // Summary
                child: cardToggle
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Profile Image
                          Container(
                            width: widget.cardHeight / 2,
                            height: widget.cardHeight / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.kScreenHeight40 * 3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Dimensions.kScreenHeight40 * 3),
                              child: Image.network(
                                'https://img.khan.co.kr/news/2023/01/02/news-p.v1.20230102.1f95577a65fc42a79ae7f990b39e7c21_P1.webp',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            widget.userData.name!,
                            // type: FontType.large,
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
