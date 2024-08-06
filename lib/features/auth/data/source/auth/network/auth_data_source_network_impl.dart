import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/data/source/auth/network/auth_data_source_network.dart';
import 'package:card_app/features/settings/data/model/key_setting_model.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:card_app/shared/functions/hive/ss_hive.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthDataSourceNetworkImpl extends AuthDataSourceNetwork {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Result<UserInfoModel>> signInWithEmail(String email, String pw, KeySettingModel settings) async {
    try {
      final UserCredential res = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pw);

      final Result<UserInfoModel> result = await getData(res.user!.uid);

      return result.when(
        success: (value) {
          return Result.success(value);
        },
        failure: (message) async {
          print('sadsd');
          final UserInfoModel newData = UserInfoModel(uid: res.user!.uid);
          await _db.collection("users").doc(res.user!.uid).set(newData.toJson());
          return Result.success(newData);
        },
      );
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<UserInfoModel>> signUpWithEmail(String email, String pw, KeySettingModel settings) async {
    try {
      final UserCredential res = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pw);

      final UserInfoModel result = await userSetting(res, settings);
      _db.collection("users").doc(res.user!.uid).set(result.toJson());

      return Result.success(result);
    } catch (e) {
      ssPrint('회원가입 실패', 'AuthDataSourceNetworkImpl');
      return Result.failure(e.toString());
    }
  }

  @override
  Future<void> updateBasicData(String uid, UserInfoModel data) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef = _db.collection("users").doc(uid);

      await _db.collection("users").doc(uid).set(data.toJson());
    } catch (e) {}
  }

  @override
  Future<Result<UserInfoModel>> getData(String uid) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef = _db.collection("users").doc(uid);

      return docRef.get().then(
        (DocumentSnapshot doc) {
          if (doc.data() == null) {
            return const Result.failure("데이터가 없습니다.");
          }
          final data = doc.data() as Map<String, dynamic>;

          return Result.success(UserInfoModel.fromJson(data));
        },
      );
    } catch (e) {
      return const Result.failure("데이터 불러오기 실패");
    }
  }
}

Future<UserInfoModel> userSetting(UserCredential res, KeySettingModel settings) async {
  final User user = res.user!;

  final UserInfoModel result = UserInfoModel.fromUser(user);

  await SsHive.setting.key.update(settings.copyWith(uid: user.uid));

  return result;
}
