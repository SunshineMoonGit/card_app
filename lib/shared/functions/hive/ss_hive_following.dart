import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/wallet/data/model/following_model.dart';
import 'package:hive/hive.dart';

//@ List<UserInfoModel> wallet
class HiveWallet {
  Future<void> add(UserInfoModel newData) async {
    await Hive.box(AppString.followings).add(newData.toJson());
  }

  int getLength() {
    return Hive.box(AppString.followings).values.toList().length;
  }

  Future<List<FollowingModel<UserInfoModel>>> get(List<FollowingModel<String>> uids) async {
    final box = Hive.box(AppString.followings).values;

    if (box.isEmpty) {
      return [];
    }

    final List<FollowingModel<UserInfoModel>> localData = box.map((e) {
      final map = e as Map<String, dynamic>; // Hive에서 가져온 데이터를 Map으로 캐스팅
      return FollowingModel<UserInfoModel>.fromJson(
        map,
        (json) => UserInfoModel.fromJson(json as Map<String, dynamic>),
      );
    }).toList();

    final List<FollowingModel<UserInfoModel>> result = localData.where((model) {
      return uids.any((element) => element.user == model.user.uid);
    }).toList();

    return result;
  }

  void deleteAll() async {
    await Hive.box(AppString.followings).clear();
  }

  Future<void> delete(String uid) async {
    final List<UserInfoModel> localData = Hive.box(AppString.followings)
        .values
        .toList()
        .map(
          (e) => UserInfoModel.fromJson(
            e.cast<String, dynamic>(),
          ),
        )
        .toList();

    int deleteIndex = localData.indexWhere((element) => element.uid == uid);

    await Hive.box(AppString.followings).deleteAt(deleteIndex);
  }
}
