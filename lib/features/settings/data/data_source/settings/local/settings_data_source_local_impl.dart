import 'package:card_app/features/settings/data/data_source/settings/local/settings_data_source_local.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/shared/class/result/result.dart';
import 'package:card_app/shared/functions/hive/ss_hive_setting.dart';

class SettingsDataSourceLocalImpl extends SettingsDataSourceLocal {
  @override
  Future<Result<SettingsModel>> get() async {
    try {
      SettingsModel data = await SsHiveSetting.get();

      return Result.success(data);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<void> update(SettingsModel newData) async {
    await SsHiveSetting.update(newData);
  }
}
