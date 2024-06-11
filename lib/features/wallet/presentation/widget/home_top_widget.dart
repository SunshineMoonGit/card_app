import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopWidget extends StatelessWidget {
  final double widgetSize;

  const HomeTopWidget({
    super.key,
    required this.widgetSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widgetSize,
          width: MediaQuery.sizeOf(context).width,
        ),
        Container(
          height: widgetSize - 50.h,
          padding: Dimensions.kPaddingAllLarge,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 7),
              ),
            ],
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimensions.kVerticalSpaceLarger,
              Text(
                '안녕하세요!',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Text(
                '강태욱님',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20.w,
          bottom: 10.h,
          child: Row(children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0, 7),
                  ),
                ],
                color: Colors.white,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.share), Text('공유')],
              ),
            ),
            Dimensions.kHorizontalSpaceMedium,
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0, 7),
                  ),
                ],
                color: Colors.white,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.add), Text('추가')],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
