import 'dart:io';

import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:card_app/features/settings/presentation/provider/setting_language_temp_provider.dart';
import 'package:card_app/features/settings/presentation/provider/settings_provider.dart';
import 'package:card_app/features/settings/presentation/provider/theme_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/custom_image_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AppMethod {
  final WidgetRef ref;

  AppMethod(this.ref);

  Future<void> init() async {
    try {
      final String deviceLocale = Platform.localeName.substring(0, 2);
      await ref.read(settingsProvider.notifier).init(deviceLocale);

      await ref.read(authInfoProvider.notifier).init();

      await ref.read(walletProvider.notifier).update(ref.read(authInfoProvider).userType);

      await ref.read(authStateProvider.notifier).check();
    } catch (e) {
      // 에러 처리
      ssPrint('init error: $e', 'app_method');
      rethrow; // 에러를 다시 던져서 상위에서 처리할 수 있게 함
    }
  }

  void changeTheme() {
    ref.read(themeProvider.notifier).toggle();
  }

  void changeLanguageTemp(String language) {
    ref.read(settingLanguageTempProvider.notifier).change(language);
  }

  bool checkLanguageTemp(String language) {
    return ref.read(settingLanguageTempProvider.notifier).check(language);
  }

  void sign(bool isSignUp, ControllerManager controllers) async {
    // // SignUp Screen
    // if (isSignUp) {
    //   await ref.read(authInfoProvider.notifier).signUpWithEmail(
    //         controllers.loginEmailController.text,
    //         controllers.loginPwController.text,
    //       );
    //   // //! redirect에다가 AuthState를 넣어서 해봐
    //   // context.push(AuthUserInfoInputScreen.route, extra: true);
    // }
    // // Login Screen
    // else {
    //   await ref.read(authInfoProvider.notifier).signInWithEmail(
    //         controllers.loginEmailController.text,
    //         controllers.loginPwController.text,
    //       );
    //   // context.go(HomeScreen.route, extra: true);
    // }
  }

  void addFollowing(UpdateType updateType, UserInfoEntity data) async {
    // 카드 이미지 경로 불러오기
    final String? imagePath = await ref.read(customImageProvider);
    final UserType userType = ref.read(authInfoProvider).userType;

    // uid 생성
    final String uid = "local_${const Uuid().v4()}";
    ssPrint(uid, 'app_method');

    // 카드 이미지 + uid + Input Data
    final UserInfoEntity newData = data.copyWith(uid: uid, cardImage: imagePath ?? '');

    // authInfo 에 저장 (String)
    ref.read(authInfoProvider.notifier).updateList(
          updateType: updateType,
          followingUid: uid,
        );

    // 로컬에 저장 (UserInfoModel)
    await ref.read(walletProvider.notifier).addLocal(newData, userType);

    ref.read(customImageProvider.notifier).clear();
  }

  Future<void> deleteFollowing(String uid) async {
    final UserType userType = ref.read(authInfoProvider).userType;
    // auth.following 에서도 삭제
    await ref.read(authInfoProvider.notifier).updateList(
          updateType: UpdateType.delete,
          followingUid: uid,
        );
    // local 에서도 지우고
    await ref.read(walletProvider.notifier).deleteLocal(uid, userType);
  }
}
