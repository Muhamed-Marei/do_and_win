import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../shured/text_form_field.dart';
import '../../../provider/aligment_request_provider.dart';

import '../../widgets/enter_point_text_form_field_wedget.dart';
import '../../widgets/transfare_Cost_data_widget_view.dart';

import 'enter_the_pubg_account_aligment.dart';

class EnterPUBGChadeAligment extends StatelessWidget {
  EnterPUBGChadeAligment({Key? key}) : super(key: key);
  TextEditingController pointNumberController = TextEditingController();
  TextEditingController transactionResultController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            backgroundColor: Color.fromRGBO(25, 32, 74, 1),
            alignment: Alignment.center,
            elevation: 100,
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            scrollable: true,
            title: TransfareCostDataAndTypeWidget(
              cost: '10',
              costType: 'شدات ببجي',
              numberOfPoint: '1000',
              title: 'شدات ببجي',
              icon: Image.asset("assets/pubg.png"),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  EnterPointTextFormFieldWidget(
                      pointNumberController: pointNumberController,
                      pointTOBalancePercentage: .5,
                      transactionResultController: transactionResultController),
                  EnterDataTextFormFiled(
                    enabled: false,
                    icon: Icons.equalizer,
                    textInputType: TextInputType.number,
                    labelText: 'شدات ببجي',
                    validator: (val) {},
                    controller: transactionResultController,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),                onPressed: () {
                  pointNumberController.clear();
                  transactionResultController.clear();
                  ref.watch(aligmentrequestProvider).back();
                  // Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  "الغاء",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  pointNumberController.clear();
                  transactionResultController.clear();
                  ref.watch(aligmentrequestProvider).cancleRequest();
                  Navigator.of(context).pop();
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.watch(aligmentrequestProvider).next(EnterPubgAccountAligment(palace: pointNumberController.text,));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
