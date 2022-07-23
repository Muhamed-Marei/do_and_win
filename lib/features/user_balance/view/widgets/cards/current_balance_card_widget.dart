import 'package:do_and_win/features/user_balance/view/widgets/view_balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../style and animation/text/text_animation.dart';
import '../../../model/user_model_balance.dart';
import '../../../provider/charter_request_type_provider.dart';
import '../../../view_model/current_user_balance.dart';
import '../charger_types_components.dart';
import '../drawal_order_components.dart';

class CurrentBalanceCardWidget extends StatelessWidget {
  CurrentUserBalanceViewModel currentUserBalanceViewModel = CurrentUserBalanceViewModel(
    textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25),
  );
  CurrentBalanceCardWidget({Key? key, required this.userModelBalance}){

  }
  late UserModelBalance userModelBalance;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/card.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              trailing: IconButton(
                  icon: const Icon(
                    Icons.info_sharp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/black.webp"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: ListTile(
                            title: TextAnimation(
                              fontSize: 35,
                              text: "تفاصيل النقاط",
                            ),
                            subtitle: ViewBalanceWidget(
                              userModelBalance: userModelBalance,
                            ),
                          ),
                        );
                      },
                    );
                  }),
              leading: const Icon(
                Icons.monetization_on,
                color: Colors.amber,
              ),
              title: const Text(
                " النقاط الحاليه",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              subtitle: currentUserBalanceViewModel,
            ),
            const CharterAndwildrawalRow()
          ],
        ),
      ),
    );
  }
}

class CharterAndwildrawalRow extends StatelessWidget {
  const CharterAndwildrawalRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  ref.watch(chageChargeAndDrawal.state).state =
                      const ChargeChargeTypeComponents();
                  //chageChargeAndDrawal
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(11, 32, 73, 1),
                ),
                child: const Text("شحن"),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  ref.watch(chageChargeAndDrawal.state).state =
                      RequestOrderComponents();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(11, 32, 73, 1),
                ),
                child: const Text("طلب سحب"),
              ),
            ))
          ],
        );
      },
    );
  }
}
