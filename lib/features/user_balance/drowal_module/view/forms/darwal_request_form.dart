import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/aligment_request_provider.dart';
import '../../provider/change_screen_provider.dart';
 const kDuration = const Duration(milliseconds: 3);
 const kCurve = Curves.ease;
class DrowalRequestForm extends StatelessWidget {
  DrowalRequestForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
       final aligmentrequest = ref.watch(aligmentrequestProvider);
        return
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller:  aligmentrequest.pageController,
            itemCount:  aligmentrequest.drowalTypeSelectedList.length,
            itemBuilder: (BuildContext context, int index) {
              return aligmentrequest.drowalTypeSelectedList[index+1 ];
            },
          );
        // PageView(
        //   physics: NeverScrollableScrollPhysics(),
        //   controller: aligmentrequest.pageController,
        //   children: aligmentrequest.drowalTypeSelectedList,
        // );
      },
    );
  }
}
