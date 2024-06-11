import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/wallet/data/data_source/wallet_data_source.dart';
import 'package:card_app/features/wallet/domain/model/wallet_item_model.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:flutter/services.dart';

class WalletRepositoryImpl extends WalletRepository {
  final WalletDataSource dataSource;

  WalletRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<UserInfoModel>> getWallet(List<int>? following) async {
    return await dataSource.getWallets(following);
  }
}
