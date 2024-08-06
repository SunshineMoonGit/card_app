import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:hive/hive.dart';

//@ List<UserInfoModel> wallet
class HiveWallet {
  Future<void> add(UserInfoModel newData) async {
    await Hive.box(AppString.followings).add(newData.toJson());
  }

  int getLength() {
    return Hive.box(AppString.followings).values.toList().length;
  }

  Future<List<UserInfoModel>> get(List<String> uidFollowings) async {
    final List<UserInfoModel> localData = Hive.box(AppString.followings)
        .values
        .toList()
        .map(
          (e) => UserInfoModel.fromJson(
            e.cast<String, dynamic>(),
          ),
        )
        .toList();

    List<UserInfoModel> result = localData.where((user) => uidFollowings.contains(user.uid)).toList();

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
