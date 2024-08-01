import 'package:card_app/shared/functions/converter/ss_text_editing_controller_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  factory SettingsModel({
    String? uid,
    required String updateTime,
    required bool darkMode,
    String? language,
    required bool notificationsEnabled,
    @SsListStringConverter() required List<String> favorites,
    @SsListStringConverter() required List<String> recent,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);

  factory SettingsModel.init() {
    return SettingsModel(
      uid: null,
      language: null,
      darkMode: false,
      notificationsEnabled: true,
      favorites: [],
      recent: [],
      updateTime: DateTime.now().toIso8601String(),
    );
  }
}



// List<UserInfoModel> fromJsonWithUserInfoModelList(List<dynamic>? data) {
//   if (data == null) {
//     return [];
//   } else {
//     return data.map((e) => UserInfoModel.fromJson(e)).toList();
//   }
// }
