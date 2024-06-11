import 'package:card_app/config/ui/theme/app_theme.dart';
import 'package:card_app/config/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'card app',
          theme: AppTheme.lightTheme,
          routerConfig: ref.watch(goRouterProvider),
        );
      },
    );
  }
}
