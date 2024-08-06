import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(String message) = Failure<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get value => when(
        success: (value) => value,
        failure: (_) => null,
      );

  String? get errorMessage => maybeWhen(
        failure: (message) => message,
        orElse: () => null,
      );
}
