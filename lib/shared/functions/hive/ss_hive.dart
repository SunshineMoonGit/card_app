import 'package:card_app/shared/functions/hive/ss_hive_auth.dart';
import 'package:card_app/shared/functions/hive/ss_hive_following.dart';
import 'package:card_app/shared/functions/hive/ss_hive_setting.dart';

class SsHive {
  static final HiveSetting setting = HiveSetting();
  static final HiveAuth auth = HiveAuth();
  static final HiveWallet wallet = HiveWallet();
}
