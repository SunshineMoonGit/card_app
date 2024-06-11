import 'package:card_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:card_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:card_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:card_app/features/wallet/data/data_source/wallet_data_source.dart';
import 'package:card_app/features/wallet/data/repository/wallet_repository_impl.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/features/wallet/domain/use_case/get_wallet.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initSingletons() async {}

void provideDataSources() {
  // Wallet
  injector.registerFactory<WalletDataSource>(() => WalletFirebase());

  // Auth
  injector.registerFactory<AuthDataSource>(() => AuthFirebase());
}

void provideRepositories() {
  // Wallet
  injector.registerFactory<WalletRepository>(() => WalletRepositoryImpl(dataSource: injector.get<WalletDataSource>()));

  // Auth
  injector.registerFactory<AuthRepository>(() => AuthRepositoryImpl(dataSource: injector.get<AuthDataSource>()));
}

void provideUseCases() {
  // Wallet
  injector.registerFactory<GetWalletUseCase>(() => GetWalletUseCase(repository: injector.get<WalletRepository>()));
}
