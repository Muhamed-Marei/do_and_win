import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/charter_request_type_provider.dart';
import '../../provider/requesr_drawal_provider.dart';
import '../../view_model/charge_type_view_model.dart';
import '../../view_model/drawal_request_view_modem.dart';

class ChargeChargeTypeComponents extends StatelessWidget {
  const ChargeChargeTypeComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SelectChargeItemTypeBar(),
        Expanded(
          child: ChargeTypeViewModel(),
        )
      ],
    );
  }
}

class SelectChargeItemTypeBar extends StatelessWidget {
  const SelectChargeItemTypeBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Row(
            children: [
              Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: ref.watch(charterTypeProvider.state).state ==
                                "pointsCharter"
                            ? const Color.fromRGBO(11, 32, 73, 1)
                            : Colors.blue,
                      ),
                      onPressed: () {
                        ref.watch(charterTypeProvider.state).state =
                            "jewelsCharter";
                      },
                      icon: Image.asset(
                        "assets/garnet.png",
                        height: 20,
                        width: 30,
                      ),
                      label: const Text(
                        "جواهر",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: ref.watch(charterTypeProvider.state).state ==
                                "pointsCharter"
                            ? Colors.blue
                            : const Color.fromRGBO(11, 32, 73, 1),
                      ),
                      onPressed: () {
                        ref.watch(charterTypeProvider.state).state =
                            "pointsCharter";
                      },
                      icon: const Icon(
                        Icons.monetization_on,
                        color: Colors.amber,
                      ),
                      label: const Text("نقاط ",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
            ],
          );
        },
      ),
    );
  }
}
