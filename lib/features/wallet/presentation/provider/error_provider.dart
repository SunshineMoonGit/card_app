import 'package:card_app/shared/widgets/notification/ss_failure_notification.dart';
import 'package:flutter/material.dart';
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
