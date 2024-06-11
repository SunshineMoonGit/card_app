import 'package:card_app/di/injector.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthProviderNotifier, UserInfoModel>((ref) {
  return AuthProviderNotifier();
});

class AuthProviderNotifier extends StateNotifier<UserInfoModel> {
  final AuthRepository repository = injector.get<AuthRepository>();

  AuthProviderNotifier() : super(UserInfoModel()) {
    getMyData();
  }

  void getMyData() async {
    state = await repository.getMyData();
  }
}
