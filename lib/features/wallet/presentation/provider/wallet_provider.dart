import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/di/injector.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/wallet/domain/model/wallet_model.dart';
import 'package:card_app/features/wallet/domain/use_case/wallet_local_use_case.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//@ Followings - List<UserInfoModel>
//@ Favorites  - List<UserInfoModel>
//! 내일 - favorite(star) walletProvider -> state update ?,
//! authInfoProvider -> favorite string 이걸로 불러와서 get -> state update
final walletProvider = StateNotifierProvider<WalletProviderNotifier, WalletModel>((ref) {
  return WalletProviderNotifier(ref);
});

class WalletProviderNotifier extends StateNotifier<WalletModel> {
  final Ref ref;

  final WalletLocalUseCase walletLocalUseCase = injector.get<WalletLocalUseCase>();

  WalletProviderNotifier(this.ref) : super(WalletModel());

  // state value setting
  Future<void> update(UserType userType) async {
    // ssPrint('init', 'wallet_provider');
    final Result<List<UserInfoEntity>> result = await _getLocal(userType);

    result.when(
      success: (value) {
        state = state.copyWith(followings: value);
      },
      failure: (message) {},
    );
  }

  // 추가 - hive
  Future<void> addLocal(UserInfoEntity newData, UserType userType) async {
    Result result = await walletLocalUseCase.addLocal(newData);

    result.when(
      success: (value) async {
        await update(userType);
      },
      failure: (message) {
        ssPrint(message, 'wallet_provider');
      },
    );
  }

  // 삭제 - hive
  Future<void> deleteLocal(String uid, UserType userType) async {
    Result<List<UserInfoEntity>> result = await walletLocalUseCase.deleteLocal(uid, state.followings);

    result.when(
      success: (value) async {
        await update(userType);
        // state = state.copyWith(followings: value);
      },
      failure: (message) {
        ssPrint(message, 'wallet_provider');
      },
    );
  }

  Future<Result<List<UserInfoEntity>>> _getLocal(UserType userType) async {
    final UserInfoEntity authInfo = ref.read(authInfoProvider);
    // ssPrint('getLocal', 'wallet_provider');
    // 일반 유저
    if (userType == UserType.normal) {
      return await walletLocalUseCase.get(authInfo.followings);
    }
    // 프리미엄 유저
    else {
      return const Result.failure('아직 구현 못했어...');
    }
  }
}
