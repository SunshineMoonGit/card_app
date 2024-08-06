import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:card_app/features/settings/domain/entity/custom_setting_entity.dart';
import 'package:card_app/features/settings/domain/entity/key_setting_entity.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/ss_print.dart';

class AuthNetworkUseCase {
  final AuthRepository repository;

  AuthNetworkUseCase({required this.repository});

  Future<Result<UserInfoEntity>> get(String uid) async {
    final Result<UserInfoEntity> result = await repository.getData(uid);

    return result.when(
      success: (value) {
        return Result.success(value);
      },
      failure: (message) {
        return Result.failure(message);
      },
    );

    // return data;
  }

  Future<Result<UserInfoEntity>> signUpWithEmail(String email, String pw, KeySettingEntity settings) async {
    Result<UserInfoEntity> result = await repository.signUpWithEmail(email, pw, settings);

    return result.when(
      success: (value) => Result.success(value),
      failure: (message) => Result.failure(message),
    );
  }

  Future<void> signInWithEmail(String email, String pw, KeySettingEntity settings) async {
    await repository.signInWithEmail(email, pw, settings);
  }
}
