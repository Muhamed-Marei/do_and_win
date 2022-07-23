import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../shured/text_form_field.dart';
import '../../../../../../style and animation/text/text_animation.dart';
import '../../../provider/aligment_request_provider.dart';

class EnterPubgAccountAligment extends StatelessWidget {
  EnterPubgAccountAligment({Key? key, required this.palace}) : super(key: key);
  late String palace;
  TextEditingController accountController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            backgroundColor: Color.fromRGBO(25, 32, 74, 1),
            title: TextAnimation(
              fontSize: 20,
              text: "حساب ببجى",
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text("سيتم تحويل  $palace الى حسابك",style: TextStyle(color: Colors.white),),
                    subtitle: const Text(
                        "برجاء ادخال كود حساب ببجى",style: TextStyle(color: Colors.white)),
                  ),
                  EnterDataTextFormFiled(
                    controller: accountController,
                    validator: (val){
                      if (val!.isEmpty) {
                        return "قم باضافة حسابك ";
                      } else {
                        return null;
                      }
                    },
                    icon: Icons.code,
                    enabled: true,
                    labelText: "كود حسابك",
                    textInputType: TextInputType.text,
                  ),
                  EnterDataTextFormFiled(
                    controller: messageController,
                    validator: (val) {},
                    icon: Icons.message_outlined,
                    enabled: true,
                    labelText: "رساله الى الادمن",
                    textInputType: TextInputType.multiline,
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                onPressed: () {
                  accountController.clear();
                  messageController.clear();
                  ref.watch(aligmentrequestProvider).back();
                },
              ),
              TextButton(
                child: const Text(
                  "الغاء",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  accountController.clear();
                  messageController.clear();
                  ref.watch(aligmentrequestProvider).cancleRequest();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("ارسل"),
                onPressed: () {
                  //ToDo add the upLode Request Function
                  if (_formKey.currentState!.validate()) {
                    accountController.clear();
                    messageController.clear();
                    Navigator.of(context).pop();
                    ref.watch(aligmentrequestProvider).cancleRequest();
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
