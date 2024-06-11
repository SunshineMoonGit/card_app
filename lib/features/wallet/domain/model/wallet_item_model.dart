// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:card_app/features/auth/domain/model/user_info_model.dart';

// part 'wallet_item_model.freezed.dart';
// part 'wallet_item_model.g.dart';

// @freezed
// class WalletItemModel with _$WalletItemModel {
//   factory WalletItemModel({
//     String? pageName,
//     List<FolderInfoModel>? pageList,
//   }) = _WalletItemModel;

//   factory WalletItemModel.fromJson(Map<String, dynamic> json) => _$WalletItemModelFromJson(json);
// }

// @freezed
// class FolderInfoModel with _$FolderInfoModel {
//   factory FolderInfoModel({
//     // List -> 1 일때는 그냥 보여주고 2 이상은 folder 이름 표기
//     String? folderName,
//     // List -> 1 일때는 그냥 보여주고 2 이상은 folder 모양
//     List<int>? folderList,
//   }) = _FolderInfoModel;

//   factory FolderInfoModel.fromJson(Map<String, dynamic> json) => _$FolderInfoModelFromJson(json);
// }

// // class FolderInfoModel<T> {
// //   final String? folderName;
// //   final List<T>? folderList;

// //   FolderInfoModel({
// //     this.folderName,
// //     this.folderList,
// //   });

// //   factory FolderInfoModel.fromJson(Map)

// //   Map<String, dynamic> toMap() {
// //     return <String, dynamic>{
// //       'folderName': folderName,
// //       'folderList': folderList.map((x) => x?.toMap()).toList(),
// //     };
// //   }

// //   factory FolderInfoModel.fromMap(Map<String, dynamic> map) {
// //     return FolderInfoModel<T>(
// //       folderName: map['folderName'] != null ? map['folderName'] as String : null,
// //       folderList: map['folderList'] != null ? List<T>.from((map['folderList'] as List<int>).map<T?>((x) => T.fromMap(x as Map<String,dynamic>),),) : null,
// //     );
// //   }

// //   String toJson() => json.encode(toMap());

// //   factory FolderInfoModel.fromJson(String source) => FolderInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
// // }
