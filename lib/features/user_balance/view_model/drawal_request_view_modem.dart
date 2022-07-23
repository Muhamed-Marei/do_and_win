

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/requesr_drawal_provider.dart';
import '../view/widgets/cards/drawal_request_card.dart';

class DrawalRequestsViewModel extends StatelessWidget {
  const DrawalRequestsViewModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return StreamBuilder<QuerySnapshot>(
          stream: ref.watch(requestCollectionStreamProvider.stream),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return const Center(child: Text("no data"));
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return DrawallRequestCard(document : document);
              }).toList(),
            );
          },
        );
      },
    );
  }
}
