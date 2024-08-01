import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/wallet/presentation/provider/modal/modal_item_provider.dart';
import 'package:card_app/features/wallet/presentation/provider/modal/modal_toggle_provider.dart';
import 'package:card_app/shared/widgets/ss_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SsRenderBottomModal extends StatelessWidget {
  const SsRenderBottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _ModalBarrier(),
        _ModalContent(),
      ],
    );
  }
}

class _ModalContent extends ConsumerWidget {
  const _ModalContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool modal = ref.watch(modalToggleProvider);
    final List<ModalItemModel> modalItem = ref.watch(modalItemProvider);
    // var imagePicker = ImagePicker();
    // XFile selectedImage;

    // Modal List 만들기
    final List<Widget> modalItemList = List.generate(
      modalItem.length * 2 - 1,
      (index) {
        if (index % 2 == 0) {
          final int pIndex = index ~/ 2;
          return InkWell(
            onTap: modalItem[pIndex].onTap,
            child: Center(
              child: SsText(
                title: modalItem[pIndex].title,
                style: TextStyle(
                  fontSize: Dimensions.ssTextFontSizeMedium,
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: Dimensions.ssPaddingHorizontal,
            child: const Divider(),
          );
        }
      },
    );

    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
        transform: Matrix4.translationValues(0, modal ? 0 : 400, 0),
        child: Material(
          borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
          child: Container(
              height: Dimensions.ssScreenHeight20 * 2 + Dimensions.ssTextFontSizeMedium * 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: modalItemList,
              )),
        ),
      ),
    );
  }
}

class _ModalBarrier extends ConsumerWidget {
  const _ModalBarrier();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool modal = ref.watch(modalToggleProvider);

    return IgnorePointer(
      ignoring: !modal,
      child: GestureDetector(
        onTap: () {
          ref.read(modalToggleProvider.notifier).hide();
        },
        child: AnimatedOpacity(
          opacity: modal ? 0.5 : 0,
          duration: const Duration(milliseconds: 250),
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
