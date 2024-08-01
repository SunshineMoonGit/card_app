// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

class SsImageFileWidget extends StatelessWidget {
  final String? imagePath;

  const SsImageFileWidget({
    super.key,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File('$imagePath'),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container();
      },
    );
  }
}
