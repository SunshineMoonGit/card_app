import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/shared/class/result/result.dart';
import 'package:card_app/shared/functions/ss_print.dart';

class AuthNetworkUseCase {
  final AuthRepository repository;

  AuthNetworkUseCase({required this.repository});

  Future<UserInfoEntity> get(String uid) async {
    final Result<UserInfoEntity> result = await repository.getData(uid);

    final UserInfoEntity data = result.when(
      success: (value) {
        ssPrint('getMyData 완료!', 'auth_info_provider');
        return value;
      },
      failure: (message) {
        ssPrint('getMyData 실패!', 'auth_info_provider');
        return UserInfoEntity();
      },
    );

    return data;
  }

  Future<void> signUpWithEmail(String email, String pw, SettingsModel settings) async {
    await repository.signUpWithEmail(email, pw, settings);
  }

  Future<void> signInWithEmail(String email, String pw, SettingsModel settings) async {
    await repository.signInWithEmail(email, pw, settings);
  }
}
