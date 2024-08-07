import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorProvider = StateNotifierProvider<ErrorProviderNotifier, String?>((ref) {
  return ErrorProviderNotifier();
});

class ErrorProviderNotifier extends StateNotifier<String?> {
  ErrorProviderNotifier() : super(null);

  void update(String error) {
    state = error;
  }

  void clear() {
    state = null;
  }
}
