import 'package:card_app/config/mapper/custom_setting_mapper.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_setting_model.freezed.dart';
part 'custom_setting_model.g.dart';

@freezed
class CustomSettingModel with _$CustomSettingModel {
  CustomSettingModel._();

  factory CustomSettingModel({
    required bool darkMode,
    String? language,
    required bool notificationsEnabled,
  }) = _CustomSettingModel;

  factory CustomSettingModel.fromJson(Map<String, dynamic> json) => _$CustomSettingModelFromJson(json);

  factory CustomSettingModel.fromEntity(CustomSettingEntity entity) => CustomSettingMapper.fromEntity(entity);

  CustomSettingEntity toEntity() => CustomSettingMapper.toEntity(this);

  factory CustomSettingModel.init(String language) {
    return CustomSettingModel(
      language: language,
      darkMode: false,
      notificationsEnabled: true,
    );
  }
}
