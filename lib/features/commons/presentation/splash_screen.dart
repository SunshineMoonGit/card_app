
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/shared/provider/app_method.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String get route => '/splash';

  final bool settingUpdate;

  const SplashScreen({
    super.key,
    this.settingUpdate = false,
  });

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppMethod(ref).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    // AppMethod(ref).init();
    // ref.listen<AsyncValue<void>>(
    //   appInitializationProvider,
    //   (_, state) => state.whenOrNull(
    //     data: (_) => WidgetsBinding.instance.addPostFrameCallback((_) {
    //       print('dd');
    //     }),
    //     error: (err, stack) {
    //       print('ss');
    //     },
    //   ),
    // );

    return SsLayout(
      body: Center(
        child: SsText(
          title: AppString.appName,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w900,
            fontSize: 50.w,
          ),
          color: context.colorScheme.primary,
        ),
      ),
      bottomNavToggle: false,
      statusBarColor: context.colorScheme.secondary,
    );
  }
}

void _showErrorDialog(BuildContext context, Object error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(error.toString()),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
