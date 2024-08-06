import 'dart:io';

import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:card_app/features/settings/presentation/provider/key_setting_provider.dart';
import 'package:card_app/features/settings/presentation/provider/setting_language_temp_provider.dart';
import 'package:card_app/features/settings/presentation/provider/custom_setting_provider.dart';
import 'package:card_app/features/settings/presentation/provider/theme_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/custom_image_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/hive/ss_hive.dart';
import 'package:card_app/shared/functions/save/form_save.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/provider/controller_provider.dart';
import 'package:card_app/shared/provider/methods/auth_method.dart';
import 'package:card_app/shared/provider/methods/theme_method.dart';
import 'package:card_app/shared/provider/methods/wallet_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppMethod {
  final WidgetRef ref;

  AppMethod(this.ref);

  late final WalletMethod wallet = WalletMethod(ref);
  late final ThemeMethod theme = ThemeMethod(ref);
  late final AuthMethod auth = AuthMethod(ref);

  Future<void> init() async {
    try {
      // SsHive.setting.custom.delete();
      ref.read(authStateProvider.notifier).change(AuthState.loading);

      final String deviceLocale = Platform.localeName.substring(0, 2);
      // 앱 커스텀 세팅
      await ref.read(customSettingProvider.notifier).init(deviceLocale);

      // 앱 키 세팅
      //! 여기서 key.uid가 없으면 로그인 화면으로 바로 가버리기
      await ref.read(keySettingProvider.notifier).init();

      // 유저 정보 init << 여기부터 시작 내일
      // 일단 여기 넘어오면 uid는 있는거임.
      // 데이터 유무 판단 후 -> 데이터 입력란 or 다음함수
      await ref.read(authInfoProvider.notifier).init();

      // 유저의 following init
      await ref.read(walletProvider.notifier).update(ref.read(authInfoProvider).userType);

      // // 유저 상태 체크
      await ref.read(authStateProvider.notifier).check();
    } catch (e) {
      // 에러 처리
      ssPrint('init error: $e', 'app_method');
      rethrow; // 에러를 다시 던져서 상위에서 처리할 수 있게 함
    }
  }
}

enum SaveType {
  local,
  network,
}
