import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../auth/google_auth/google_auth.dart';
import '../../style and animation/text/text_animation.dart';

class SplashScreen extends StatefulWidget {
  // didn't use ant setState using StatefulWidget only for using initState for timer
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      if (kIsWeb) {
        signInWithGoogleWeb();
      } else {
        signInWithGoogle();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Colors.deepPurple,
                Colors.indigo,
                Colors.blueAccent,
                Colors.cyanAccent,
                Colors.blueAccent,
                Colors.deepPurple,
                Colors.black,
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height:100,),
                Image.asset(
                  "assets/74668-win-animation.gif",
                  height: 300.0,
                  width: 300.0,
                ),
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(child: ScaleTextAnimation(fontSize: 75)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
