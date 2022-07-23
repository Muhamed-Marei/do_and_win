import 'package:do_and_win/features/user_profile/view/widgets/update_user_data_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../auth/user_regestration/view/widgets/user_regestration_image_widget.dart';
import '../../../../shured/text_form_field.dart';
import '../../model/update_user_model.dart';
import '../../provider/user_provider.dart';

class UserDataFormWidget extends StatelessWidget {
  bool enabled = false;
  late UpdateUserModel userDataModal;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UserDataFormWidget({Key? key, required this.userDataModal})
      : super(key: key) {
    phoneController.text = userDataModal.phone;
    nameController.text = userDataModal.name;
    emailController.text = userDataModal.email;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                userRegestrationImageWidget(),
                EnterDataTextFormFiled(
                  icon: Icons.perm_identity,
                  textInputType: TextInputType.name,
                  labelText: 'ادخل الاسم',
                  validator: validateName,
                  controller: nameController,
                  enabled: ref.watch(enabledProvider.state).state,
                ),
                EnterDataTextFormFiled(
                  enabled: false,
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  labelText: 'ادخل الاميل',
                  validator: validateEmail,
                  controller: emailController,
                ),
                EnterDataTextFormFiled(
                  enabled: ref.watch(enabledProvider.state).state,
                  icon: Icons.phone_iphone_rounded,
                  textInputType: TextInputType.phone,
                  labelText: 'ادخل الهاتف',
                  validator: validateMobile,
                  controller: phoneController,
                ),
                ref.watch(enabledProvider.state).state
                    ? UpDataUserDataButtom(
                        ref: ref,
                        updateUserModel: UpdateUserModel(
                            imageUrl: userDataModal.imageUrl,
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text),
                        userNameController: nameController,
                        phoneController: phoneController,
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
