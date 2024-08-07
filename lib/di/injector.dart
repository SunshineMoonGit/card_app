import 'package:card_app/features/auth/data/source/auth/local/auth_data_source_local.dart';
import 'package:card_app/features/auth/data/source/auth/local/auth_data_source_local_impl.dart';
import 'package:card_app/features/auth/data/source/auth/network/auth_data_source_network.dart';
import 'package:card_app/features/auth/data/source/auth/network/auth_data_source_network_impl.dart';
import 'package:card_app/features/auth/domain/use_case/auth_network_use_case.dart';
import 'package:card_app/features/settings/data/source/settings/local/settings_data_source_local.dart';
import 'package:card_app/features/settings/data/source/settings/local/settings_data_source_local_impl.dart';
import 'package:card_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:card_app/features/settings/data/repository/settings_repository_impl.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:card_app/features/settings/domain/repository/settings_repository.dart';
import 'package:card_app/features/settings/domain/use_case/custom_setting_local_use_case.dart';
import 'package:card_app/features/settings/domain/use_case/key_setting_local_use_case.dart';
import 'package:card_app/features/wallet/data/source/local/wallet_data_source_local_impl.dart';
import 'package:card_app/features/wallet/data/source/network/wallet_data_source_network.dart';
import 'package:card_app/features/wallet/data/source/network/wallet_data_source_network_impl.dart';
import 'package:card_app/features/wallet/data/source/local/wallet_data_source_local.dart';
import 'package:card_app/features/wallet/data/repository/wallet_repository_impl.dart';
import 'package:card_app/features/wallet/domain/repository/wallet_repository.dart';
import 'package:card_app/features/wallet/domain/use_case/wallet_local_use_case.dart';
import 'package:card_app/features/wallet/domain/use_case/wallet_network_use_case.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initSingletons() async {}

void provideDataSources() {
  //@ Wallet Local
  injector.registerFactory<WalletDataSourceLocal>(() => WalletDataSourceLocalImpl());
  //@ Wallet Network
  injector.registerFactory<WalletDataSourceNetwork>(() => WalletDataSourceNetworkImpl());

  //@ Auth
  injector.registerFactory<AuthDataSourceLocal>(() => AuthDataSourceLocalImpl());
  injector.registerFactory<AuthDataSourceNetwork>(() => AuthDataSourceNetworkImpl());

  //@ Settings
  injector.registerFactory<SettingsDataSourceLocal>(() => SettingsDataSourceLocalImpl());
}

void provideRepositories() {
  //@ Wallet
  injector.registerFactory<WalletRepository>(
    () => WalletRepositoryImpl(
      localDataSource: injector.get<WalletDataSourceLocal>(),
      networkDataSource: injector.get<WalletDataSourceNetwork>(),
    ),
  );

  //@ Auth
  injector.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      dataSourceLocal: injector.get<AuthDataSourceLocal>(),
      dataSourceNetwork: injector.get<AuthDataSourceNetwork>(),
    ),
  );

  //@ Settings
  injector.registerFactory<SettingsRepository>(
    () => SettingsRepositoryImpl(dataSource: injector.get<SettingsDataSourceLocal>()),
  );
}

void provideUseCases() {
  //@ WalletNetwork
  injector
      .registerFactory<WalletNetworkUseCase>(() => WalletNetworkUseCase(repository: injector.get<WalletRepository>()));
  //@ WalletLocal
  injector.registerFactory<WalletLocalUseCase>(() => WalletLocalUseCase(repository: injector.get<WalletRepository>()));

  //@ Auth
  injector.registerFactory<AuthNetworkUseCase>(() => AuthNetworkUseCase(repository: injector.get<AuthRepository>()));

  //@ Settings
  injector.registerFactory<CustomSettingLocalUseCase>(
      () => CustomSettingLocalUseCase(repository: injector.get<SettingsRepository>()));
  injector.registerFactory<KeySettingLocalUseCase>(
      () => KeySettingLocalUseCase(repository: injector.get<SettingsRepository>()));
}
