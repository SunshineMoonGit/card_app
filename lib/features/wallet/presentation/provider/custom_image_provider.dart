import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/wallet/presentation/provider/modal/modal_toggle_provider.dart';
import 'package:card_app/shared/functions/app_dir/ss_app_dir_image.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;

final customImageProvider = StateNotifierProvider<CustomImageProviderNotifier, String?>((ref) {
  return CustomImageProviderNotifier(ref);
});

class CustomImageProviderNotifier extends StateNotifier<String?> {
  final Ref ref;
  CustomImageProviderNotifier(this.ref) : super(null);

  void clear() {
    state = null;
  }

  //@ 사진 선택
  Future<void> getImage(GetImageMethod method) async {
    // 먼저 모달 창 끄기
    ref.read(modalToggleProvider.notifier).hide();

    var imagePicker = ImagePicker();
    XFile? image;
    if (method == GetImageMethod.gallery) {
      image = await imagePicker.pickImage(source: ImageSource.gallery);
    } else {
      image = await imagePicker.pickImage(source: ImageSource.camera);
    }

    if (image != null) {
      ssPrint('이미지가 선택되었습니다.', 'add_card_provider');
      // image.
      state = image.path;
    } else {
      ssPrint('아무것도 선택하지 않았습니다.', 'add_card_provider');
    }
  }

  Future<String> saveImage(String uid, bool isPremium) async {
    return await SsAppDirImage.saveLocal(state, uid);
  }
}
