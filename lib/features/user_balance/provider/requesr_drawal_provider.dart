import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/google_auth/google_auth.dart';

StreamProvider<QuerySnapshot<Map<String, dynamic>>>
requestCollectionStreamProvider =
StreamProvider<QuerySnapshot<Map<String, dynamic>>>((ref) =>
    FirebaseFirestore.instance
        .collection('withdrawalRequests')
        .where("uid", isEqualTo: currentUserData.uid)
        .where("new", isEqualTo: ref.watch(requestCaseProvider.state).state)
        .snapshots());
StateProvider<bool> requestCaseProvider = StateProvider<bool>((ref) => true);
