import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_and_win/layout/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/user_model_balance.dart';
import '../../../provider/user_current_balance_provider.dart';

class WithdrawalRequestCard extends StatelessWidget {
  late TextStyle textStyle;
  late DocumentSnapshot snapshot;
  WithdrawalRequestCard(
      {Key? key, required this.textStyle, required this.snapshot})
      : super(key: key) {
    mainWidgetRef
        .watch(todosProvider.notifier)
        .grtCurrentPoint(UserModelBalance.fromMap(snapshot));
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      "${mainWidgetRef.read(todosProvider).currentPoint}",
      style: textStyle,
    );
  }
}
