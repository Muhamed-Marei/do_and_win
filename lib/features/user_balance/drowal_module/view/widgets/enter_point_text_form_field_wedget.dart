import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/user_current_balance_provider.dart';
import '../../../view/widgets/cards/withdrawal_request_card.dart';

class EnterPointTextFormFieldWidget extends StatelessWidget {
  EnterPointTextFormFieldWidget(
      {Key? key,
      required this.pointNumberController,
      required this.pointTOBalancePercentage,
      required this.transactionResultController})
      : super(key: key);
  late TextEditingController pointNumberController;
  late TextEditingController transactionResultController;
  late double pointTOBalancePercentage;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return TextFormField(
          enabled: true,
          onChanged: (val) {
            if (pointNumberController.text.length == 0) {
              transactionResultController.text = 0.toString();
            } else {
              if (pointNumberController.text.isEmpty) {
                transactionResultController.text = 0.toString();
              } else {
                transactionResultController.text =
                    (int.parse(val) * pointTOBalancePercentage).toString();
              }
            }
          },
          keyboardType: TextInputType.number,
          validator: (val) {
            if (pointNumberController.text.length != 0 &&
                int.parse(pointNumberController.text) <=
                    ref.watch(todosProvider).currentPoint) {
              return null;
            } else {
              return "please right data ";
            }
          },
          textDirection: TextDirection.ltr,
          controller: pointNumberController,
          decoration: InputDecoration(
            focusColor: Colors.white,
            labelStyle: const TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: "ReemKufi-VariableFont_wght"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: const Icon(
              Icons.monetization_on,
              color: Colors.amber,
            ),
            labelText: 'ادخل عدد النقاط',
          ),
        );
      },
    );
  }
}
