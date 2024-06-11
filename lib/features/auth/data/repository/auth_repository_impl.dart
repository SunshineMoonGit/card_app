import 'package:card_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:card_app/features/auth/domain/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<UserInfoModel> getMyData() {
    return dataSource.getMyData();
  }
}
