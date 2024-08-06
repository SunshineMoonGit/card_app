import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/di/injector.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:card_app/features/auth/domain/use_case/auth_network_use_case.dart';
import 'package:card_app/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/features/settings/presentation/provider/custom_setting_provider.dart';
import 'package:card_app/features/settings/presentation/provider/key_setting_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/error_provider.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/hive/ss_hive.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/widgets/notification/ss_failure_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInfoProviderNotifier extends StateNotifier<UserInfoEntity> {
  AuthInfoProviderNotifier(this.ref) : super(UserInfoEntity(userType: UserType.normal));

  final AuthRepository repository = injector.get<AuthRepository>();
  final AuthNetworkUseCase authNetworkUseCase = injector.get<AuthNetworkUseCase>();
  final Ref ref;

  //@ 사용 : signUp singIn newCard

  //@ 맨 처음 실행 되는 함수
  Future<void> init() async {
    final String? uid = ref.read(keySettingProvider).uid;

    await _getData(uid!);
  }

  //@ Email 회원가입
  Future<void> signUpWithEmail(String email, String pw) async {
    final KeySettingEntity settings = ref.read(keySettingProvider);

    Result<UserInfoEntity> result = await authNetworkUseCase.signUpWithEmail(email, pw, settings);

    if (result.isFailure) {
      // 실패 시 알림 표시
      ref.read(errorProvider.notifier).update(result.errorMessage.toString());
      return;
    }

    final KeySettingModel updateSettings = await SsHive.setting.key.get();

    await ref.read(keySettingProvider.notifier).update(updateSettings.toEntity());

    await _getData(updateSettings.uid!);
  }

  //@ Email 로그인
  Future<void> signInWithEmail(String email, String pw) async {
    final KeySettingEntity settings = ref.read(keySettingProvider);
    await authNetworkUseCase.signInWithEmail(email, pw, settings);

    await _getData(settings.uid!);
  }

  //@ SignOut
  Future<void> clear() async {
    state = UserInfoEntity();
  }

  Future<void> update(UserInfoEntity data) async {
    final String uid = state.uid;

    await repository.updateBasicData(uid, data.copyWith(uid: uid));

    state = data.copyWith(uid: uid);
  }

  Future<void> _getData(String uid) async {
    final Result<UserInfoEntity> result = await authNetworkUseCase.get(uid);

    result.when(
      success: (value) {
        state = value;
      },
      failure: (message) {
        ref.read(errorProvider.notifier).update(message);
        state = state.copyWith(uid: uid);
        ref.read(authStateProvider.notifier).change(AuthState.authenticatedButIncomplete);
      },
    );
  }

  //@ Following Method
  Future<void> updateFollowing(UpdateType updateType, String uid) async {
    // state 변경
    switch (updateType) {
      case UpdateType.add:
        state = state.addFollowing(uid);
        break;
      case UpdateType.delete:
      case UpdateType.change:
    }
    // 저장소에 저장
    await update(state);
  }

  Future<void> updateFavorite(UpdateType updateType, String uid) async {}
}

final authInfoProvider = StateNotifierProvider<AuthInfoProviderNotifier, UserInfoEntity>((ref) {
  return AuthInfoProviderNotifier(ref);
});
