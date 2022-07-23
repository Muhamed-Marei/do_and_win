import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../shured/text_form_field.dart';
import '../../../../../../style and animation/text/text_animation.dart';
import '../../../provider/aligment_request_provider.dart';

class EnterPhoneAligment extends StatelessWidget {
  EnterPhoneAligment({Key? key, required this.palace}) : super(key: key);
  late String palace;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cheekPhoneNumberController = TextEditingController();
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
              text: "محفظه الكترونيه ",
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "سيتم تحويل  $palace الى محفظتك",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                        "برجال ادخال رقم هاتف يحتولى على محفظه الكترونيه لتحويل المبلغ",
                        style: TextStyle(color: Colors.white)),
                  ),
                  EnterDataTextFormFiled(
                    controller: phoneNumberController,
                    validator: validateMobile,
                    icon: Icons.phone_android,
                    enabled: true,
                    labelText: "ادخل رقم الهاتف",
                    textInputType: TextInputType.phone,
                  ),
                  EnterDataTextFormFiled(
                    controller: cheekPhoneNumberController,
                    validator: (val) {
                      if (cheekPhoneNumberController.text ==
                          phoneNumberController.text) {
                        return null;
                      } else {
                        return "الرقم غير مطابق";
                      }
                    },
                    icon: Icons.phone_android,
                    enabled: true,
                    labelText: "تاكيد رقم الهاتف",
                    textInputType: TextInputType.phone,
                  ),
                  EnterDataTextFormFiled(
                    controller: messageController,
                    validator: (val) {},
                    icon: Icons.message_outlined,
                    enabled: true,
                    labelText: "رساله الى الادمن",
                    textInputType: TextInputType.text,
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                onPressed: () {
                  phoneNumberController.clear();
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
                  phoneNumberController.clear();
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
                    phoneNumberController.clear();
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
