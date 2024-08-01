import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeProviderNotifier, bool>((ref) {
  return ThemeProviderNotifier();
});

class ThemeProviderNotifier extends StateNotifier<bool> {
  ThemeProviderNotifier() : super(true) {
    // setting local -> get
  }

  void get() {}

  void toggle() {
    state = !state;
  }
}
