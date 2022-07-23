
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/screens/sellect_drawal_type.dart';

final aligmentrequestProvider =
ChangeNotifierProvider<AligmentrequestProvider>((ref) {
  return AligmentrequestProvider();
});

class AligmentrequestProvider extends ChangeNotifier {
  PageController pageController = PageController();
  List<Widget> drowalTypeSelectedList = [
    Center(child: Container(color: Colors.amber, height: 100, width: 50,)),
    SelectDrawalType()
  ];
  cancleRequest(){
    pageController.initialPage+1;
    drowalTypeSelectedList = [
      Center(child: Container(color: Colors.amber, height: 100, width: 50,)),
      SelectDrawalType()
    ] ;
  //  notifyListeners();
  }
  back() {
    pageController
        .previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease)
        .whenComplete(() => removeLast());
    notifyListeners();
  }
  removeLast() {
    drowalTypeSelectedList.removeLast();
    notifyListeners();
  }
  next(Widget nextPage) {
    print(drowalTypeSelectedList.length);
    drowalTypeSelectedList.add(nextPage);
    print(drowalTypeSelectedList.length);
    notifyListeners();
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }
  notifyListeners();
}


