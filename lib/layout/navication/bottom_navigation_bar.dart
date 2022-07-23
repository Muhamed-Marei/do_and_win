import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:do_and_win/layout/navication/navication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../main.dart';
import '../provider/home_provider.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return CurvedNavigationBar(
        backgroundColor: const Color.fromRGBO(70, 138, 197, 1),
        color: const Color.fromRGBO(11, 32, 73, 1),
        //buttonBackgroundColor: const Color.fromRGBO(70, 138, 197, 1),
        items:screensIconList ,
        height: 55,
        index:  ref.watch(selectedScreenProvider.state).state,
        onTap: (index) {
          ref.watch(selectedScreenProvider.state).state = index ;
        },
      ) ;
    },);
  }
}
navigateScreen({required Widget nextScreen} ){
  mainWidgetRef.watch(currentScreenProvider.state).state = nextScreen;
}