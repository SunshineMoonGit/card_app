import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/provider/controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    if (provider.name == "pageIndexProvider" ||
        provider.runtimeType == StateNotifierProvider<ControllerProviderNotifier, ControllerManager?>) {
      return;
    }

    ssPrint(
      '$newValue ',
      '${provider.name ?? provider.runtimeType}',
      false,
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  final WidgetRef ref;

  MyNavigatorObserver(this.ref);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // 특정 페이지가 pop될 때 수행할 작업
    print(route.settings.name);
    // if (route.settings.name == '/myPage') {
    //   ref.invalidate(myNotifierProvider);
    // }
  }
}
