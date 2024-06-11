import 'package:card_app/di/injector.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:card_app/features/wallet/domain/model/wallet_item_model.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/features/wallet/domain/use_case/get_wallet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletProvider = StateNotifierProvider<WalletProviderNotifier, List<UserInfoModel>?>((ref) {
  final UserInfoModel myData = ref.watch(authProvider);

  return WalletProviderNotifier(myData);
});

class WalletProviderNotifier extends StateNotifier<List<UserInfoModel>?> {
  final UserInfoModel myData;

  final GetWalletUseCase _getWalletUseCase = injector.get<GetWalletUseCase>();

  WalletProviderNotifier(this.myData) : super([]) {
    initWallet();
  }

  void initWallet() async {
    final List<int>? following = myData.following;

    state = await _getWalletUseCase(following);
    // state = myData.wallet;
  }
}
