import 'package:card_app/features/wallet/domain/model/wallet_item_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  factory UserInfoModel({
    int? uid,
    String? name,
    String? profileImage,
    String? cardImage,
    String? email,
    String? team,
    String? company,
    String? phone,
    String? fax,
    List<int>? following,
    // List<WalletItemModel>? wallet,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);

  static List<UserInfoWithIcon> infoWithIcon({
    required UserInfoModel data,
  }) {
    return [
      UserInfoWithIcon(icon: const Icon(Icons.business_outlined), info: data.company!),
      UserInfoWithIcon(icon: const Icon(Icons.group_outlined), info: data.team!),
      UserInfoWithIcon(icon: const Icon(Icons.phone_outlined), info: data.phone!),
      UserInfoWithIcon(icon: const Icon(Icons.fax_outlined), info: data.fax!),
      UserInfoWithIcon(icon: const Icon(Icons.email_outlined), info: data.email!),
    ];
  }
}

class UserInfoWithIcon {
  final Icon icon;
  final String info;

  UserInfoWithIcon({
    required this.icon,
    required this.info,
  });

  UserInfoWithIcon copyWith({
    Icon? icon,
    String? info,
  }) {
    return UserInfoWithIcon(
      icon: icon ?? this.icon,
      info: info ?? this.info,
    );
  }

  @override
  String toString() => 'UserInfoWithIcon(icon: $icon, info: $info)';
}
