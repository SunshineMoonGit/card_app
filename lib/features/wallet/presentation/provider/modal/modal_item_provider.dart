import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/features/wallet/presentation/provider/custom_image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModalItemModel {
  final String title;
  final void Function() onTap;

  ModalItemModel({
    required this.title,
    required this.onTap,
  });
}

final modalItemProvider = Provider<List<ModalItemModel>>((ref) {
  return [
    ModalItemModel(
      title: '앨범에서 가져오기',
      onTap: () => ref.read(customImageProvider.notifier).getImage(GetImageMethod.gallery),
    ),
    ModalItemModel(
      title: '사진찍기',
      onTap: () => ref.read(customImageProvider.notifier).getImage(GetImageMethod.camera),
    ),
  ];
});
