import 'package:card_app/shared/provider/text_controller_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_index_provider.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int value) {
    state = value;
  }
}
