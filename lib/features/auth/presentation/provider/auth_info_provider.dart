import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/di/injector.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/domain/repository/auth_repository.dart';
import 'package:card_app/features/auth/domain/use_case/user_info_use_case.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/features/settings/presentation/provider/settings_provider.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInfoProviderNotifier extends StateNotifier<UserInfoEntity> {
  AuthInfoProviderNotifier(this.ref) : super(UserInfoEntity());

  final AuthRepository repository = injector.get<AuthRepository>();
  final AuthNetworkUseCase authNetworkUseCase = injector.get<AuthNetworkUseCase>();
  final Ref ref;

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController profileImageController;
  late final TextEditingController cardImageController;
  late final TextEditingController teamController;
  late final TextEditingController companyController;
  late final TextEditingController phoneController;
  late final TextEditingController faxController;

  //@ 사용 : signUp singIn newCard
  void initControllers() {
    nameController = TextEditingController(text: state.name);
    emailController = TextEditingController(text: state.email);
    profileImageController = TextEditingController(text: state.profileImage);
    cardImageController = TextEditingController(text: state.cardImage);
    teamController = TextEditingController(text: state.team);
    companyController = TextEditingController(text: state.company);
    phoneController = TextEditingController(text: state.phone);
    faxController = TextEditingController(text: state.fax);

    nameController.addListener(_updateController);
    emailController.addListener(_updateController);
    profileImageController.addListener(_updateController);
    cardImageController.addListener(_updateController);
    teamController.addListener(_updateController);
    companyController.addListener(_updateController);
    phoneController.addListener(_updateController);
    faxController.addListener(_updateController);
  }

  //@ 맨 처음 실행 되는 함수
  Future<void> init() async {
    final String? uid = ref.read(settingsProvider).uid;

    if (uid == null) {
      return;
    }

    state = await _getData(uid);
  }

  //@ Email 회원가입
  Future<void> signUpWithEmail(String email, String pw) async {
    final SettingsModel settings = ref.read(settingsProvider);

    await authNetworkUseCase.signUpWithEmail(email, pw, settings);

    state = await _getData(settings.uid!);
  }

  //@ Email 로그인
  Future<void> signInWithEmail(String email, String pw) async {
    final SettingsModel settings = ref.read(settingsProvider);
    await authNetworkUseCase.signInWithEmail(email, pw, settings);

    state = await _getData(settings.uid!);
  }

  Future<void> update(UserInfoEntity data) async {
    ssPrint('updateData 시작!', 'auth_info_provider');

    final String uid = state.uid;

    // state = state.copyWith(updateData: data);

    await repository.updateBasicData(uid, state);
    ssPrint('updateData 완료!', 'auth_info_provider');
  }

  Future<void> updateFollowing(String uid) async {
    state = state.addFollowing(uid);
  }

  Future<void> updateList({
    required UpdateType updateType,
    String? followingUid,
    String? favoriteUid,
  }) async {
    List<String> followings = List.of(state.followings);
    List<String> favorites = List.of(state.favorites);

    switch (updateType) {
      case UpdateType.add:
        if (followingUid != null) {
          ssPrint('$updateType 시작', 'auth_info_provider');
          followings.add(followingUid);
        }
        if (favoriteUid != null) {
          favorites.add(favoriteUid);
        }
        break;
      case UpdateType.delete:
        ssPrint('$updateType 시작', 'auth_info_provider');
        ssPrint('$followingUid', 'auth_info_provider');

        if (followingUid != null) {
          followings.remove(followingUid);
        }
        if (favoriteUid != null) {
          favorites.remove(favoriteUid);
        }
        break;
      case UpdateType.change:
        ssPrint('$updateType 시작', 'auth_info_provider');
        break;
    }

    UserInfoEntity newData = state.copyWith(
      followings: followings,
      favorites: favorites,
    );

    await update(newData);
    ssPrint('$updateType 완료', 'auth_info_provider');
  }

  void _updateController() {
    state = state.copyWith(
      name: nameController.text,
      email: emailController.text,
      profileImage: profileImageController.text,
      cardImage: cardImageController.text,
      team: teamController.text,
      company: companyController.text,
      phone: phoneController.text,
      fax: faxController.text,
    );
  }

  Future<UserInfoEntity> _getData(String uid) async {
    final UserInfoEntity result = await authNetworkUseCase.get(uid);

    return result;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    profileImageController.dispose();
    cardImageController.dispose();
    teamController.dispose();
    companyController.dispose();
    phoneController.dispose();
    faxController.dispose();
    super.dispose();
  }
}

final authInfoProvider = StateNotifierProvider<AuthInfoProviderNotifier, UserInfoEntity>((ref) {
  return AuthInfoProviderNotifier(ref);
});
