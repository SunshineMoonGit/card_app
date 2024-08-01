import 'package:json_annotation/json_annotation.dart';

class SsListStringConverter implements JsonConverter<List<String>?, List<dynamic>?> {
  const SsListStringConverter();

  @override
  List<String> fromJson(List<dynamic>? jsonData) {
    return jsonData?.map((e) => e as String).toList() ?? [];
  }

  @override
  List<dynamic>? toJson(List<String>? data) {
    return data;
  }
}
