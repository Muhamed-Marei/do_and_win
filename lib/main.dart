import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'layout/provider/home_provider.dart';
import 'layout/view/screens/home_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MobileAds.instance.initialize();
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      color: Colors.purple,
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromRGBO(11, 32, 73, 1)
        )
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child:
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          mainWidgetRef = ref;
          return ref.watch(mainHomeScreenProvider.state).state;
        },
      )) ,
    );
  }
}


