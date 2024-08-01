import 'package:card_app/config/app/app_path.dart';
import 'package:card_app/shared/functions/converter/ss_function_converter.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'ss_external_model.freezed.dart';
part 'ss_external_model.g.dart';

@freezed
class SsExternalModel with _$SsExternalModel {
  factory SsExternalModel({
    required String platform,
    required String key,
    @FunctionConverter() Future<void> Function()? onTap,
  }) = _SsExternalModel;

  factory SsExternalModel.fromJson(Map<String, dynamic> json) => _$SsExternalModelFromJson(json);

  static Future<void> _launchApp(String platform, String key) async {
    String nativeUrl;
    String webUrl;

    switch (platform) {
      case AppPath.instagram:
        nativeUrl = "instagram://user?username=$key";
        webUrl = "https://www.instagram.com/$key";
        break;
      case AppPath.youtube:
        nativeUrl = "youtube://$key";
        webUrl = "https://www.youtube.com/@$key";
        break;
      case AppPath.facebook:
        nativeUrl = "fb://profile/$key";
        webUrl = "https://www.facebook.com/$key";
        break;
      case AppPath.github:
        nativeUrl = "https://github.com/$key";
        webUrl = "https://github.com/$key";
        break;
      case AppPath.soundCloud:
        // nativeUrl = "soundcloud://users:$key";
        nativeUrl = "";
        webUrl = "https://soundcloud.com/$key";
        break;
      case AppPath.x:
        nativeUrl = "twitter://user?screen_name=$key";
        webUrl = "https://twitter.com/$key";
        break;
      default:
        nativeUrl = key;
        webUrl = key;
    }

    try {
      // print(nativeUrl);
      // if (await canLaunchUrlString(nativeUrl)) {
      ssPrint('nativeUrl', 'ss_external_model');
      await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
      // } else {
      //   ssPrint('webUrl', 'ss_external_model');
      //   await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
      // }
    } catch (e) {
      ssPrint(e.toString(), 'ss_external_model');
      await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
    }
  }

  static SsExternalModel renderPlatform(SsExternalModel data) {
    return SsExternalModel(
      platform: data.platform,
      key: data.key,
      onTap: () async {
        await _launchApp(data.platform, data.key);
      },
    );
  }
}

List<String> platforms = [
  AppPath.youtube,
  AppPath.x,
  AppPath.facebook,
  AppPath.github,
  AppPath.instagram,
  AppPath.soundCloud,
];
