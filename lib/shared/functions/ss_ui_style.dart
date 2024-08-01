import 'package:card_app/shared/widgets/ss_app_bar.dart';
import 'package:flutter/services.dart';

void ssUiStyle({
  required Brightness brightness,
  required Color statusBarColor,
  required Color navBarColor,
  required bool isIOS,
}) {
  late Brightness reverseBrightness;

  if (brightness == Brightness.light) {
    reverseBrightness = Brightness.dark;
  } else {
    reverseBrightness = Brightness.light;
  }

  if (isIOS) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: statusBarBrightness(
          brightness: brightness,
          statusBarColor: statusBarColor,
        ),
      ),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarBrightness(
          brightness: brightness,
          statusBarColor: statusBarColor,
        ),
        // statusBarBrightness: Brightness.light,
        statusBarColor: statusBarColor,
        systemNavigationBarColor: navBarColor,
        systemNavigationBarIconBrightness: reverseBrightness,
      ),
    );
  }
}
