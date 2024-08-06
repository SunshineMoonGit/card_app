import 'package:flutter/material.dart';

void ssFailureNotification(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text('Sign Up Failed: $message'),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
