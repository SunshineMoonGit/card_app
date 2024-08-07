import 'dart:async';

import 'package:card_app/features/auth/data/model/user_info_model.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/data/model/following_model.dart';
import 'package:card_app/features/wallet/data/source/network/wallet_data_source_network.dart';
import 'package:card_app/shared/class/result_model/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WalletDataSourceNetworkImpl extends WalletDataSourceNetwork {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Result<List<FollowingModel<UserInfoModel>>>> get(String uid, List<FollowingModel<String>> followings) async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          _db.collection("users").doc(uid).collection('following');

      List<FollowingModel<UserInfoModel>> result = [];
      final QuerySnapshot<Map<String, dynamic>> snapshot = await collectionRef.get();
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = snapshot.docs;

      if (docs.isEmpty) {
        return const Result.failure('저장한 명함이 없습니다.');
      }
      //! 지금은 무작정 다 가져옴.
      for (var doc in docs) {
        final data = doc.data();
        final userInfoData = data['user'] as Map<String, dynamic>;
        final userInfo = UserInfoModel.fromJson(userInfoData);

        result.add(FollowingModel<UserInfoModel>(
          user: userInfo,
          favorite: data['favorite'] ?? false,
          linked: data['linked'] ?? false,
        ));
      }

      return Result.success(result);
    } catch (e) {
      print(e);
      return const Result.failure('지갑을 불러오는데 실패했습니다.');
    }
  }

  @override
  Future<Result<String>> add(String uid, FollowingModel<UserInfoModel> newData) async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          _db.collection("users").doc(uid).collection('following');

      await collectionRef.doc(newData.user.uid).set(newData.toJson((user) => user.toJson()));

      return const Result.success('지갑에 저장했습니다.');
    } catch (e) {
      return const Result.failure('지갑에 저장하지 못했습니다.');
    }
  }
}
