import 'package:card_app/config/mapper/key_setting_mapper.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/shared/functions/converter/ss_text_editing_controller_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_setting_model.freezed.dart';
part 'key_setting_model.g.dart';

@freezed
class KeySettingModel with _$KeySettingModel {
  const KeySettingModel._();

  factory KeySettingModel({
    String? uid,
    required String updateTime,
    @SsListStringConverter() required List<String> favorites,
    @SsListStringConverter() required List<String> recent,
  }) = _KeySettingModel;

  factory KeySettingModel.fromJson(Map<String, dynamic> json) => _$KeySettingModelFromJson(json);

  factory KeySettingModel.fromEntity(KeySettingEntity entity) => KeySettingMapper.fromEntity(entity);

  KeySettingEntity toEntity() => KeySettingMapper.toEntity(this);

  factory KeySettingModel.init() {
    return KeySettingModel(
      uid: null,
      updateTime: DateTime.now().toIso8601String(),
      favorites: [],
      recent: [],
    );
  }
}
