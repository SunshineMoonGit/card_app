import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/di/injector.dart';
import 'package:card_app/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/features/settings/domain/use_case/key_setting_local_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keySettingProvider = StateNotifierProvider<KeySettingProviderNotifier, KeySettingEntity>((ref) {
  return KeySettingProviderNotifier(ref);
});

class KeySettingProviderNotifier extends StateNotifier<KeySettingEntity> {
  final Ref ref;
  final KeySettingLocalUseCase settingsLocalUseCase = injector.get<KeySettingLocalUseCase>();

  KeySettingProviderNotifier(this.ref) : super(KeySettingEntity.init());

  Future<void> init() async {
    state = await settingsLocalUseCase.init();

    if (state.uid == null) {
      ref.read(authStateProvider.notifier).change(AuthState.unauthenticated);
    }
  }

  Future<void> update(KeySettingEntity newData) async {}

  Future<void> clear() async {}
}
