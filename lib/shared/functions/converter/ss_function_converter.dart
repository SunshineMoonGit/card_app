import 'package:json_annotation/json_annotation.dart';

class FunctionConverter implements JsonConverter<Future<void> Function()?, String?> {
  const FunctionConverter();

  @override
  Future<void> Function()? fromJson(String? json) {
    // JSON에서 함수로 변환하는 로직을 작성합니다.
    // 여기서는 예제 함수로 변환합니다.
    // if (json == 'exampleFunction') {
    //   return () {
    //     print('Example function called with value: ');
    //   };
    // }
    return null;
  }

  @override
  String? toJson(Future<void> Function()? function) {
    // 함수에서 JSON으로 변환하는 로직을 작성합니다.
    // 여기서는 예제 함수의 식별자를 반환합니다.
    if (function != null) {
      return 'exampleFunction';
    }
    return null;
  }
}
