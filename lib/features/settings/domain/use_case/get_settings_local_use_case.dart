import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';
import 'package:card_app/shared/class/result/result.dart';
import 'package:card_app/shared/functions/ss_print.dart';

class SettingsLocalUseCase {
  final SettingsRepository repository;

  SettingsLocalUseCase({required this.repository});

  Future<SettingsModel> get(String language) async {
    // return repository.get();

    Result<SettingsModel> result = await repository.get();

    final SettingsModel data = result.when(
      success: (value) {
        ssPrint('Setting Local Data 존재 > GET', 'settings_provider');
        return value;
      },
      failure: (message) {
        ssPrint('Setting init 완료', 'settings_provider');
        return SettingsModel.init().copyWith(
          language: language,
          updateTime: DateTime.now().toIso8601String(),
        );
      },
    );
    return data;
  }

  Future<void> update(SettingsModel newData) async {
    await repository.update(newData);
  }
}
