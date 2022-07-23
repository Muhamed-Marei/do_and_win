


import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_regestration_model.dart';

addUserData({required UserRegestrationModel userModel})async{
  CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
 await userCollection.doc(userModel.uId).set(userModel.toMap());

}