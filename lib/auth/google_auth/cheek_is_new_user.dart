import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_and_win/auth/google_auth/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../layout/provider/home_provider.dart';
import '../../layout/view/screens/current_page.dart';
import '../user_regestration/model/user_regestration_model.dart';
import '../user_regestration/provider/user_image_regestration_provider.dart';
import '../user_regestration/view/screen/block_csreen.dart';
import '../user_regestration/view/screen/regestration_user_screen.dart';
import '../user_regestration/view_model/add_user_data_to_firebase.dart';

final checkIsNewUserProvider =
    ChangeNotifierProvider((ref) => CheckIsNewUser());

class CheckIsNewUser extends ChangeNotifier {
  DocumentReference<Map<String, dynamic>> userDoc =
      FirebaseFirestore.instance.collection('users').doc(currentUserData.uid);

  late UserRegestrationModel userData;
  void isNewUser() async {
    await userDoc.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        userData = UserRegestrationModel.fromMap(documentSnapshot);
      } else {
        userData = UserRegestrationModel(
          imageUrl: currentUserData.photoURL!.toString(),
          uId: currentUserData.uid.toString(),
          name: currentUserData.displayName.toString(),
          phone: " ".toString(),
          email: currentUserData.email.toString(),
          currentPoint: 0,
          totalPoint: 0,
          chargingPoints: 0,
          givenPoint: 0,
          inviteUsersPoint: 0,
          taskPoint: 0,
          watchVideoPoint: 0,
          block: false,
        );
        addUserData(userModel: userData);
      }
    });
    if(userData.block){
      mainWidgetRef.watch(mainHomeScreenProvider.state).state = const BlockScreen();
    }else{
      mainWidgetRef.watch(currentUserDataProvider.state).state = userData;
      mainWidgetRef.watch(mainHomeScreenProvider.state).state =
      const CurrentPage();
    }
    notifyListeners();
  }
  // void upDateData() async {
  //   await userDoc.get().then((DocumentSnapshot documentSnapshot) {
  //     userData = UserRegestrationModel.fromMap(documentSnapshot);
  //   });
  //   mainWidgetRef.watch(currentUserDataProvider.state).state = userData;
  //   notifyListeners();
  // }
}

//
//
// isNewUser() async {
//   try {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(currentUserData.uid)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) async {
//       if (documentSnapshot.exists) {
//         mainWidgetRef.watch(currentUserDataProvider.state).state =
//             UserRegestrationModel.fromMap(documentSnapshot);
//         mainWidgetRef.watch(mainHomeScreenProvider.state).state =
//             const CurrentPage();
//       } else if (!documentSnapshot.exists) {
//         addUserData(
//             userModel: UserRegestrationModel(
//                 imageUrl: currentUserData.photoURL!.toString(),
//                 uId: currentUserData.uid.toString(),
//                 name: currentUserData.displayName.toString(),
//                 phone: " ".toString(),
//                 email: currentUserData.email.toString(),
//                 userBalance: 0));
//         mainWidgetRef.watch(currentUserDataProvider.state).state =UserRegestrationModel(
//             imageUrl: currentUserData.photoURL!.toString(),
//             uId: currentUserData.uid.toString(),
//             name: currentUserData.displayName.toString(),
//             phone: " ".toString(),
//             email: currentUserData.email.toString(),
//             userBalance: 0) ;
//         mainWidgetRef.watch(mainHomeScreenProvider.state).state = const CurrentPage();
//       } else {}
//     });
//   } catch (e) {
//     print("=================================>$e");
//   }
// }
