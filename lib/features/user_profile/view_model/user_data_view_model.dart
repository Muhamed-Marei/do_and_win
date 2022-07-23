import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_and_win/features/user_profile/model/update_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../auth/google_auth/google_auth.dart';
import '../view/widgets/user_data_form.dart';

//currentUserDataProvider
class UserProfileViewModel extends StatelessWidget {
  const UserProfileViewModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserData.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        }
        //UpdateUserModel
        return UserDataFormWidget(
            userDataModal: UpdateUserModel.fromMap(snapshot.data));
      },
    );
  }
}
