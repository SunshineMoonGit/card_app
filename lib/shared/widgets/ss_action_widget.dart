import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';

class SsActionsModel {
  final void Function() onTap;
  final String? title;
  final TextStyle? textStyle;
  final IconData? iconData;

  SsActionsModel({
    this.iconData,
    required this.onTap,
    this.textStyle,
    this.title,
  });

  static List<Widget> icon(List<SsActionsModel> data) {
    return List.generate(data.length, (index) {
      return GestureDetector(
        onTap: data[index].onTap,
        child: Padding(
          padding: EdgeInsets.only(
            right: Dimensions.ssScreenWidth20,
          ),
          child: Icon(data[index].iconData),
        ),
      );
    });
  }

  static List<Widget> text(List<SsActionsModel> data) {
    return List.generate(data.length, (index) {
      return GestureDetector(
        onTap: data[index].onTap,
        child: Padding(
          padding: EdgeInsets.only(
            right: Dimensions.ssScreenWidth20,
          ),
          child: SsText(
            title: '${data[index].title}',
            style: data[index].textStyle!,
          ),
        ),
      );
    });
  }
}
