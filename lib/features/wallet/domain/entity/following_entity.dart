
import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_entity.freezed.dart';

@freezed
class FollowingEntity<T> with _$FollowingEntity<T> {
  factory FollowingEntity({
    required T user,
    @Default(false) bool favorite,
    @Default(false) bool linked,
  }) = _FollowingEntity<T>;
}
