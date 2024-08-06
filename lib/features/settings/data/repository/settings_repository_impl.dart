import 'package:card_app/features/settings/data/model/custom_setting_model.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/features/settings/data/source/settings/local/settings_data_source_local.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';
import 'package:card_app/generated/intl/messages_en.dart';
import 'package:card_app/shared/class/result_model/result.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsDataSourceLocal dataSource;

  SettingsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<CustomSettingEntity> customInit(String language) async {
    final CustomSettingModel result = await dataSource.customInit(language);

    return result.toEntity();
  }

  @override
  Future<void> customUpdate(CustomSettingEntity newData) {
    return dataSource.customUpdate(CustomSettingModel.fromEntity(newData));
    // return Result.success(CustomSettingEntity.init())  ;
  }

  @override
  Future<KeySettingEntity> keyInit() async {
    final KeySettingModel result = await dataSource.keyInit();

    return result.toEntity();
  }

  @override
  Future<void> keyUpdate(KeySettingEntity newData) async {
    return dataSource.keyUpdate(KeySettingModel.fromEntity(newData));
  }
}
