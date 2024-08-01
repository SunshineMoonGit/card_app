import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';

class UpdateSettingsLocalUseCase {
  final SettingsRepository repository;

  UpdateSettingsLocalUseCase({required this.repository});

  Future<void> call(SettingsModel newData) {
    return repository.update(newData);
  }
}
