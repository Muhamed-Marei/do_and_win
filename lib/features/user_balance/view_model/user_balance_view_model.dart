

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../auth/google_auth/google_auth.dart';
import '../model/user_model_balance.dart';
import '../view/screens/wallet_screen.dart';
import '../view/widgets/view_balance_widget.dart';

class UserBalanceViewModel extends StatelessWidget {
  const UserBalanceViewModel({Key? key}) : super(key: key);
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
          return const Center(child: CircularProgressIndicator());
        }
        //UpdateUserModel
        return WalletScreen(userModelBalance: UserModelBalance.fromMap(snapshot.data),)

         ;
      },
    );
  }
}

// ListView(
// children: [
// ViewBalanceWidget(
// userModelBalance: UserModelBalance.fromMap(snapshot.data),
// )
// ],
// )