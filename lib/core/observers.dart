
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    if (provider.name == "pageIndexProvider") {
      return;
    }

    ssPrint(
      '$newValue ',
      '${provider.name ?? provider.runtimeType}',
      false,
    );
  }
}
