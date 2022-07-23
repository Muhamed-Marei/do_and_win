import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shured/text_form_field.dart';
import '../../../../style and animation/text/text_animation.dart';
import '../../drowal_module/provider/aligment_request_provider.dart';
import '../../drowal_module/view/screens/sellect_drawal_type.dart';
import '../../view_model/drawal_request_view_modem.dart';
import 'cards/withdrawal_request_card.dart';
import 'change_drawal_request_case_widget.dart';
import '../../drowal_module/view/forms/darwal_request_form.dart';

class RequestOrderComponents extends StatelessWidget {
  RequestOrderComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
       Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
         return  ElevatedButton.icon(
             onPressed: () {

               showDialog(
                 context: context,
                 barrierDismissible: false,
                 builder: (BuildContext context) {
                   return DrowalRequestForm() ;
                 },
               );
             },
             icon: Icon(Icons.account_circle_outlined),
             label: Text("طلب سحب"),
             style: ElevatedButton.styleFrom(
               primary: const Color.fromRGBO(11, 32, 73, 1),
             ));
       },),
        const ButtonTabToChangeRequestCase(),
        const Expanded(
          child: DrawalRequestsViewModel(),
        )
      ],
    );
  }
}
