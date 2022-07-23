import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/charter_request_type_provider.dart';

class ChargeTypeViewModel extends StatelessWidget {
  ChargeTypeViewModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ref.watch(charterCollectionProvider).when(
            data: (QuerySnapshot valio) {
          return Text(
            "${valio.docs[0]["name"]}",
            style: const TextStyle(color: Colors.white),
          );
        }, loading: () {
          return const CircularProgressIndicator();
        }, error: (Object error, StackTrace? stackTrace) {
          return const Center(
            child: Text("error"),
          );
        });
      },
    );
  }
}
