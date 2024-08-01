import 'package:card_app/config/app/app_path.dart';
import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/data/source/auth/network/auth_data_source_network.dart';
import 'package:card_app/features/settings/domain/model/settings_model.dart';
import 'package:card_app/shared/class/result/result.dart';
import 'package:card_app/shared/functions/hive/ss_hive_setting.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSourceNetworkImpl extends AuthDataSourceNetwork {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createNewStore(UserInfoModel newData, String uid) async {
    await _firestore.collection(AppPath.networkPath).doc(uid).set(newData.toJson());
  }

  @override
  Future<void> signUpWithEmail(String email, String pw, SettingsModel settings) async {
    try {
      final UserCredential auth = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pw);

      final String uid = auth.user!.uid;
      final String updateTime = DateTime.now().toIso8601String();

      final UserInfoModel data = UserInfoModel(uid: uid, userType: UserType.normal, lastUpdate: updateTime);

      await createNewStore(data, uid);

      await SsHiveSetting.update(settings.copyWith(uid: uid, updateTime: updateTime));
    } catch (e) {
      ssPrint(e, 'auth_data_source_network_impl');
    }
  }

  @override
  Future<void> signInWithEmail(String email, String pw, SettingsModel settings) async {
    try {
      final UserCredential auth = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pw);

      final String uid = auth.user!.uid;
      final String updateTime = DateTime.now().toIso8601String();

      await SsHiveSetting.update(settings.copyWith(uid: uid, updateTime: updateTime));
    } catch (e) {
      ssPrint(e, 'auth_data_source_network_impl');
    }
  }

  @override
  Future<void> updateBasicData(String uid, UserInfoModel data) async {
    try {
      Map<String, dynamic> updateData = data.toJson();

      // null 값을 가진 항목 제거
      updateData.removeWhere((key, value) => value == null);

      await _firestore.collection(AppPath.networkPath).doc(uid).update(updateData);
    } catch (e) {
      ssPrint('UpdateBasicData', 'UpdateBasicData');
    }
  }

  @override
  Future<Result<UserInfoModel>> getData(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore.collection(AppPath.networkPath).doc(uid).get();
      UserInfoModel data;
      if (snapshot.exists) {
        data = UserInfoModel.fromJson(snapshot.data()!);
        // return result;
      } else {
        throw const Result.failure('No Data');
      }

      return Result.success(data);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  // 이름 업데이트
  Future<void> updateName(String userId, String newName) async {
    await _firestore.collection(AppPath.networkPath).doc(userId).update({
      'name': newName,
      'lastUpdate': DateTime.now().toIso8601String(),
    });
  }

  // 이메일 업데이트
  Future<void> updateEmail(String userId, String newEmail) async {
    await _firestore.collection(AppPath.networkPath).doc(userId).update({
      'email': newEmail,
      'lastUpdate': DateTime.now().toIso8601String(),
    });
  }

  // 전화번호 업데이트
  Future<void> updatePhone(String userId, String newPhone) async {
    await _firestore.collection(AppPath.networkPath).doc(userId).update({
      'phone': newPhone,
      'lastUpdate': DateTime.now().toIso8601String(),
    });
  }

  // 팔로잉 목록 업데이트
  Future<void> updateFollowings(String userId, List<String> newFollowings) async {
    await _firestore.collection(AppPath.networkPath).doc(userId).update({
      'followings': newFollowings,
      'lastUpdate': DateTime.now().toIso8601String(),
    });
  }

  // 즐겨찾기 목록 업데이트
  Future<void> updateFavorites(String userId, List<String> newFavorites) async {
    await _firestore.collection(AppPath.networkPath).doc(userId).update({
      'favorites': newFavorites,
      'lastUpdate': DateTime.now().toIso8601String(),
    });
  }

  // 추가 필드 업데이트
  Future<void> updateExtra(String userId, List<String> newExtra) async {
    await _firestore.collection(AppPath.networkPath).doc(userId).update({
      'extra': newExtra,
      'lastUpdate': DateTime.now().toIso8601String(),
    });
  }

  // 마지막 업데이트 시간만 업데이트
  Future<void> updateLastUpdate(String userId) async {
    await _firestore.collection(AppPath.networkPath).doc(userId).update({
      'lastUpdate': DateTime.now().toIso8601String(),
    });
  }
}
