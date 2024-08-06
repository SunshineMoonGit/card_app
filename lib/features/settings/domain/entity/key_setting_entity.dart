import 'package:card_app/shared/functions/converter/ss_text_editing_controller_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_setting_entity.freezed.dart';
part 'key_setting_entity.g.dart';

@freezed
class KeySettingEntity with _$KeySettingEntity {
  factory KeySettingEntity({
    String? uid,
    required String updateTime,
    @SsListStringConverter() required List<String> favorites,
    @SsListStringConverter() required List<String> recent,
  }) = _KeySettingEntity;

  factory KeySettingEntity.fromJson(Map<String, dynamic> json) => _$KeySettingEntityFromJson(json);

  factory KeySettingEntity.init() {
    return KeySettingEntity(
      uid: null,
      favorites: [],
      recent: [],
      updateTime: DateTime.now().toIso8601String(),
    );
  }
}
