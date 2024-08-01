import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/config/ui/theme_extension.dart';
import 'package:card_app/features/auth/domain/entity/user_info_entity.dart';
import 'package:card_app/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:card_app/features/wallet/presentation/widget/empty_wallet_widget.dart';
import 'package:card_app/features/wallet/presentation/widget/list_wallet_widget.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/widgets/ss_action_widget.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletScreen extends ConsumerWidget {
  static String get route => '/wallet';

  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<UserInfoEntity> followings = ref.watch(walletProvider).followings;

    List<SsActionsModel> actions = [
      SsActionsModel(
        onTap: () => ssPrint('tap! search', 'WalletScreen'),
        iconData: Icons.search,
      ),
      SsActionsModel(
        onTap: () => ssPrint('tap! settings', 'WalletScreen'),
        iconData: Icons.settings,
      ),
    ];

    return SsLayout(
      statusBarColor: context.colorScheme.background,
      appBarTitle: AppString.wallet,
      actions: SsActionsModel.icon(actions),
      body: followings.isEmpty ? const EmptyWalletWidget() : ListWalletWidget(followings: followings),
    );
  }
}
