// import 'package:do_and_win/shured/text_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../google_auth/cheek_is_new_user.dart';
// import '../../../google_auth/google_auth.dart';
// import '../../model/user_regestration_model.dart';
// import '../../provider/user_image_regestration_provider.dart';
// import '../../view_model/add_user_data_to_firebase.dart';
// import '../widgets/user_regestration_image_widget.dart';
//
// class RegistrationScreen extends StatelessWidget {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//
//   late String imageLink;
//   RegistrationScreen({Key? key}) : super(key: key) {
//     phoneController.text = currentUserData.phoneNumber != null
//         ? currentUserData.displayName!
//         : "enter your phone";
//     nameController.text = currentUserData.displayName != null
//         ? currentUserData.displayName!
//         : "enter your name";
//     emailController.text = currentUserData.email != null
//         ? currentUserData.email!
//         : "enter your email";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const userRegestrationImageWidget(),
//               EnterDataTextFormFiled(
//                 icon: Icons.perm_identity,
//                 textInputType: TextInputType.name,
//                 labelText: 'ادخل الاسم',
//                 validator: validateName,
//                 controller: nameController,
//               ),
//               EnterDataTextFormFiled(
//                 icon: Icons.email,
//                 textInputType: TextInputType.emailAddress,
//                 labelText: 'ادخل الاميل',
//                 validator: validateEmail,
//                 controller: emailController,
//               ),
//               EnterDataTextFormFiled(
//                 icon: Icons.phone_iphone_rounded,
//                 textInputType: TextInputType.phone,
//                 labelText: 'ادخل الهاتف',
//                 validator: validateMobile,
//                 controller: phoneController,
//               ),
//               Consumer(
//                 builder: (BuildContext context, WidgetRef ref, Widget? child) {
//                   return ElevatedButton.icon(
//                     onPressed: () async {
//                       ref.watch(CurrentImageFileProvuder.state).state == "null"
//                           ? addUserData(
//                               userModel: UserRegestrationModel(
//                                   imageUrl: currentUserData.photoURL.toString(),
//                                   uId: currentUserData.uid,
//                                   name: nameController.text,
//                                   phone: phoneController.text,
//                                   email: emailController.text))
//                           : await uploadFile(
//                                   imageFile: ref.watch(CurrentImageFileProvuder.state).state)
//                               .whenComplete(() {})
//                               .then((value) {
//                                 print("------------------$value");
//                               addUserData(
//                                   userModel: UserRegestrationModel(
//                                       imageUrl: value,
//                                       uId: currentUserData.uid,
//                                       name: nameController.text,
//                                       phone: phoneController.text,
//                                       email: emailController.text));
//                             });
//                           isNewUser();
//                     },
//                     label: const Text("التالى"),
//                     icon: const Icon(Icons.arrow_forward_sharp),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
