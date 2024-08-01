import 'package:card_app/features/settings/data/data_source/settings/local/settings_data_source_local.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';
import 'package:card_app/shared/class/result/result.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsDataSourceLocal dataSource;

  SettingsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<SettingsModel>> get() {
    return dataSource.get();
  }

  @override
  Future<void> update(SettingsModel newData) {
    return dataSource.update(newData);
  }
}
