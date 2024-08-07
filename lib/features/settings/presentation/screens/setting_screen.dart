import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/settings/presentation/widget/ss_render_setting_row_widget.dart';
import 'package:card_app/shared/provider/methods/app_method.dart';
import 'package:card_app/shared/widgets/ss_button_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_render_setting_column_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends ConsumerWidget {
  static String get route => '/setting';

  const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   final TextEditingController settingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SsLayout(
      appBarTitle: 'setting',
      centerTitle: true,
      bottomNavToggle: true,
      body: const CustomScrollView(
        slivers: [
          //@ 설정 검색
          // _renderSearch(),

          //@ 설정 리스트
          SsRenderSettingColumnWidget(
            child: SsRenderSettingRowWidget(type: SettingType.main),
          ),
        ],
      ),
      bottomNavigationBar: _renderSignOut(ref),
    );
  }

  // Widget _renderSearch() {
  //   return SliverToBoxAdapter(
  //     child: Padding(
  //       padding: Dimensions.ssPaddingHorizontal,
  //       child: SsTextFormField(
  //         validator: (val) {
  //           return null;
  //         },
  //         hintText: 'search',
  //         prefixIcon: const Icon(Icons.search),
  //         controller: settingController,
  //         // onChanged: (p0) {},
  //       ),
  //     ),
  //   );
  // }

  Widget _renderSignOut(WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.ssScreenHeight20),
      child: SsButtonWidget(
        title: '로그아웃',
        backgroundColor: Colors.red,
        onTap: () {
          AppMethod(ref).auth.signOut();
        },
      ),
    );
  }
}
