import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/di/injector.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/wallet/domain/entity/following_entity.dart';
import 'package:card_app/features/wallet/domain/use_case/wallet_local_use_case.dart';
import 'package:card_app/features/wallet/domain/use_case/wallet_network_use_case.dart';
import 'package:card_app/features/wallet/presentation/provider/error_provider.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//@ Followings - List<UserInfoModel>
// 기본적으로 firebase 문서안에 following 만들어서 넣기
// 연결시 Linked true

final walletProvider = StateNotifierProvider<WalletProviderNotifier, List<FollowingEntity<UserInfoEntity>>>((ref) {
  return WalletProviderNotifier(ref);
});

class WalletProviderNotifier extends StateNotifier<List<FollowingEntity<UserInfoEntity>>> {
  final Ref ref;

  final WalletLocalUseCase localUseCase = injector.get<WalletLocalUseCase>();
  final WalletNetworkUseCase networkUseCase = injector.get<WalletNetworkUseCase>();

  WalletProviderNotifier(this.ref) : super([]);

  Future<void> get() async {
    final UserInfoEntity authInfo = ref.read(authInfoProvider);
    Result<List<FollowingEntity<UserInfoEntity>>> result = await networkUseCase.get(authInfo.uid, authInfo.followings);

    result.when(
      success: (value) {
        print(value);
        state = value;
      },
      failure: (message) {
        ref.read(errorProvider.notifier).update(message);
      },
    );
  }

  Future<void> add(UserInfoEntity newData) async {
    final String authUid = ref.read(authInfoProvider).uid;
    final FollowingEntity<UserInfoEntity> pNewData = FollowingEntity(user: newData);

    final Result<String> result = await networkUseCase.add(authUid, pNewData);
    state = [...state, pNewData];

    result.when(
      success: (value) async {
        ref.read(errorProvider.notifier).update(value);
      },
      failure: (message) {
        ref.read(errorProvider.notifier).update(message);
      },
    );
  }

  // 삭제 - hive
  Future<void> deleteLocal(String uid, UserType userType) async {
    // Result<List<UserInfoEntity>> result = await localUseCase.deleteLocal(uid, state.followings);

    // result.when(
    //   success: (value) async {
    //     await update(userType);
    //     // state = state.copyWith(followings: value);
    //   },
    //   failure: (message) {
    //     ssPrint(message, 'wallet_provider');
    //   },
    // );
  }

  // Future<Result<List<UserInfoEntity>>> _getLocal(UserType userType) async {
  //   final UserInfoEntity authInfo = ref.read(authInfoProvider);
  //   // ssPrint('getLocal', 'wallet_provider');
  //   // 일반 유저
  //   if (userType == UserType.normal) {
  //     // return await localUseCase.get(authInfo.followings);
  //   }
  //   // 프리미엄 유저
  //   else {
  //     return const Result.failure('아직 구현 못했어...');
  //   }
  // }
}
