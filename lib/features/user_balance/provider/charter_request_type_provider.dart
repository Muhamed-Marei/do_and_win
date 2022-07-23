import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/google_auth/google_auth.dart';
import '../view/widgets/charger_types_components.dart';

FutureProvider<QuerySnapshot>
charterCollectionProvider =
FutureProvider<QuerySnapshot>((ref) =>
     FirebaseFirestore.instance.collection(ref.watch(charterTypeProvider.state).state).get());

//jewelsCharter
//pointsCharter
//charterTypeProvider
StateProvider<String> charterTypeProvider
= StateProvider<String>((ref) => "pointsCharter");


StateProvider<Widget> chageChargeAndDrawal =
StateProvider((ref) => const ChargeChargeTypeComponents());

