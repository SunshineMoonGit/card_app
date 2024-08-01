import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class SsIconConverter implements JsonConverter<Icon?, Map<String, dynamic>?> {
  const SsIconConverter();

  @override
  Icon? fromJson(Map<String, dynamic>? json) {
    if (json?['icon'] == null) return null;
    return json?['icon'] as Icon;
  }

  @override
  Map<String, dynamic>? toJson(Icon? icon) {
    if (icon == null) return null;
    return {'icon': icon};
  }
}
