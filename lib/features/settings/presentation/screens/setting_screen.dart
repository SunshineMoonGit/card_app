import 'package:card_app/config/app/app_enum.dart';
import 'package:card_app/config/ui/app_dimensions.dart';
import 'package:card_app/features/settings/presentation/widget/ss_render_setting_row_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:card_app/shared/widgets/ss_render_setting_column_widget.dart.dart';
import 'package:card_app/shared/widgets/text_form_field/ss_text_form_field.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static String get route => '/setting';

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController settingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SsLayout(
      appBarTitle: 'setting',
      centerTitle: true,
      bottomNavToggle: false,
      body: CustomScrollView(
        slivers: [
          //@ 설정 검색
          _renderSearch(),

          //@ 설정 리스트
          const SsRenderSettingColumnWidget(
            child: SsRenderSettingRowWidget(type: SettingType.main),
          ),
        ],
      ),
    );
  }

  Widget _renderSearch() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: SsTextFormField(
          validator: (val) {
            return null;
          },
          hintText: 'search',
          prefixIcon: const Icon(Icons.search),
          controller: settingController,
          // onChanged: (p0) {},
        ),
      ),
    );
  }
}
