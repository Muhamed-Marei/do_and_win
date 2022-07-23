import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/src/state_provider.dart';

import '../../initiate_app/splash_screen/splash_screen.dart';
import '../../layout/provider/home_provider.dart';
import 'cheek_is_new_user.dart';

late User currentUserData;
CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

Future signInWithGoogleWeb() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();
  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
  await FirebaseAuth.instance
      .signInWithPopup(googleProvider)
      .whenComplete(() => null)
      .then((value) {
    currentUserData = value.user!;
  });
  mainWidgetRef.watch(checkIsNewUserProvider).isNewUser();
}

Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  await FirebaseAuth.instance
      .signInWithCredential(credential)
      .whenComplete(() => null)
      .then((value) {
    currentUserData = value.user!;
  });

  //  Once signed in, cheek if new user
  mainWidgetRef.watch(checkIsNewUserProvider).isNewUser();
}

Future<void> signOut(context) async {
  await GoogleSignIn().signOut().whenComplete(() {});
  mainWidgetRef.watch(mainHomeScreenProvider.state).state = SplashScreen();
}
