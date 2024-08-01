import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/shared/class/result/result.dart';

abstract class SettingsDataSourceLocal {
  Future<Result<SettingsModel>> get();
  Future<void> update(SettingsModel newData);
}
