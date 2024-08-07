import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_setting_entity.freezed.dart';
part 'custom_setting_entity.g.dart';

@freezed
class CustomSettingEntity with _$CustomSettingEntity {
  factory CustomSettingEntity({
    @Default(false) bool darkMode,
    String? language,
    @Default(true) bool notificationsEnabled,
    @Default([]) List<int> recent,
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
