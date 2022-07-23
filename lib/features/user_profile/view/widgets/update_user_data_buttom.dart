import 'dart:async';

import 'package:flutter/material.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../auth/google_auth/google_auth.dart';
import '../../../../auth/user_regestration/provider/user_image_regestration_provider.dart';
import '../../../../auth/user_regestration/view/widgets/user_regestration_image_widget.dart';
import '../../model/update_user_model.dart';
import '../../provider/user_provider.dart';

class UpDataUserDataButtom extends StatelessWidget {
  late UpdateUserModel updateUserModel;
   TextEditingController  userNameController  =TextEditingController();
   TextEditingController phoneController   =TextEditingController();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  late WidgetRef ref;
  UpDataUserDataButtom(
      {Key? key, required this.updateUserModel, required this.ref,required this.phoneController,required this.userNameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      successColor: Colors.green,
      successIcon: Icons.offline_pin,
      child: Text('تحديث', style: TextStyle(color: Colors.white)),
      controller: _btnController,
      onPressed: () async {
        ref.watch(enabledProvider.state).state = false;
        _doSomething();
        ref.watch(CurrentImageFileProvuder.state).state == "null"
            ? usersCollection
                .doc(ref.watch(currentUserDataProvider.state).state.uId)
                .update(UpdateUserModel(
            name: userNameController.text,
            email: updateUserModel.email,
            phone: phoneController.text,
            imageUrl: updateUserModel.imageUrl)
            .toMap())
            : await uploadFile(
                    imageFile: ref.watch(CurrentImageFileProvuder.state).state)
                .whenComplete(() {

        })
                .then((value) {
                usersCollection
                    .doc(ref.watch(currentUserDataProvider.state).state.uId)
                    .update(UpdateUserModel(
                            name: updateUserModel.name,
                            email: updateUserModel.email,
                            phone: updateUserModel.phone,
                            imageUrl: value)
                        .toMap());
                ref.watch(CurrentImageFileProvuder.state).state = "null";
              });
        ref.watch(CurrentImageFileProvuder.state).state = "null";
      },
    );
  }

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });
  }
}
