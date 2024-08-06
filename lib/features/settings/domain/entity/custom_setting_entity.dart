import 'package:card_app/shared/functions/converter/ss_text_editing_controller_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_setting_entity.freezed.dart';
part 'custom_setting_entity.g.dart';

@freezed
class CustomSettingEntity with _$CustomSettingEntity {
  factory CustomSettingEntity({
    required bool darkMode,
    String? language,
    required bool notificationsEnabled,
  }) = _CustomSettingEntity;

  factory CustomSettingEntity.fromJson(Map<String, dynamic> json) => _$CustomSettingEntityFromJson(json);

  factory CustomSettingEntity.init() {
    return CustomSettingEntity(
      language: null,
      darkMode: false,
      notificationsEnabled: true,
    );
  }
}
