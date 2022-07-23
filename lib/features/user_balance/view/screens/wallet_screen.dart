import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/user_model_balance.dart';
import '../../provider/charter_request_type_provider.dart';
import '../widgets/cards/current_balance_card_widget.dart';
import '../widgets/charger_types_components.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key, required this.userModelBalance}) : super(key: key);
  late UserModelBalance userModelBalance;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          children: [
            CurrentBalanceCardWidget(userModelBalance: userModelBalance),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 2,
              color: Colors.white,
            ),
            Expanded(child: ref.watch(chageChargeAndDrawal.state).state),
          ],
        );
      },
    );
  }
}

