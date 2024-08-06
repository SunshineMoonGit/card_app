import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/auth/presentation/provider/auth_info_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/custom_image_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/shared/class/controller_manager.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/provider/controller_provider.dart';
import 'package:card_app/shared/provider/methods/app_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

//@ Following
//@ Favorite
class WalletMethod {
  final WidgetRef ref;

  WalletMethod(this.ref);

  Future<void> addFollowing(NewCardController controllers) async {
    final NewCardController controller = ref.read(controllerProvider.notifier).submit(controllers);

    // 데이터 만들기
    final UserInfoEntity newData = await _makeNewCard(controller);

    // authInfo 에 저장 (String)
    ref.read(authInfoProvider.notifier).updateFollowing(UpdateType.add, newData.uid);

    // 로컬에 저장 (UserInfoModel) + 임시로 UserType
    await ref.read(walletProvider.notifier).addLocal(newData, UserType.normal);

    ref.read(customImageProvider.notifier).clear();
  }

  Future<void> deleteFollowing(String uid) async {
    final UserType userType = ref.read(authInfoProvider).userType;
    // auth.following 에서도 삭제
    await ref.read(authInfoProvider.notifier).updateFollowing(UpdateType.delete, uid);

    // 만약 favorite에 있으면 그것도 지워야함.

    // local 에서도 지우고
    await ref.read(walletProvider.notifier).deleteLocal(uid, userType);
  }

  Future<UserInfoEntity> _makeNewCard(NewCardController value) async {
    final UserInfoEntity data = UserInfoEntity.fromController(value);

    // 저장 방식 선택 (로컬 or 네트워크)
    final SaveType userType = _saveType();

    // 카드 이미지 경로 불러오기
    final String? imagePath = await ref.read(customImageProvider);

    // uid 생성
    final String uid = "local_${const Uuid().v4()}";

    // 카드 이미지 + uid + Input Data
    final UserInfoEntity newData = data.copyWith(uid: uid, cardImage: imagePath ?? '');

    return newData;
  }

  SaveType _saveType() {
    final UserType userType = ref.read(authInfoProvider).userType;

    if (userType == UserType.normal) {
      return SaveType.local;
    } else {
      return SaveType.network;
    }
  }
}
