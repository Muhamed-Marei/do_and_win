import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_and_win/features/user_balance/view/widgets/cards/withdrawal_request_card.dart';
import 'package:flutter/material.dart';

import '../../../auth/google_auth/google_auth.dart';


class CurrentUserBalanceViewModel extends StatelessWidget {
  late TextStyle textStyle;
  CurrentUserBalanceViewModel({Key? key, required this.textStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').doc(currentUserData.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return WithdrawalRequestCard(
          textStyle: textStyle,
          snapshot: snapshot.data,
        );
      },
    );
  }
}
