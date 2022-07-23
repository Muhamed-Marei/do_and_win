import 'package:do_and_win/features/user_balance/drowal_module/view/screens/pubg_algment/enter_the_pubg_chad_aligment.dart';
import 'package:do_and_win/features/user_balance/drowal_module/view/screens/vf-cash-aligment/enter_the_palance_aligment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/aligment_request_provider.dart';

class SelectDrawalType extends StatefulWidget {
  SelectDrawalType({Key? key}) : super(key: key);
  @override
  State<SelectDrawalType> createState() => _SelectDrawalTypeState();
}

class _SelectDrawalTypeState extends State<SelectDrawalType> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: AlertDialog(
          backgroundColor: Color.fromRGBO(25, 32, 74, 1),
          title: const Text(
            "سحب عن طريق",
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              children:  [
                DrawalTypeCard( nestScreen: EnterTheBalanceAligment(), title:  "محفظه الكترونيه",imagePath: "assets/e-wallet-unscreen.gif"),
                DrawalTypeCard( nestScreen: EnterPUBGChadeAligment(), title:  "شدات ببجي",imagePath: "assets/pubg.png"),
                DrawalTypeCard( nestScreen: EnterTheBalanceAligment(), title:  "جواهر فرى فير",imagePath: "assets/freeFire.jpg"),

              ],
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("الغاء",style: TextStyle(color: Colors.red),))
          ],
        ));
  }
}

class DrawalTypeCard extends StatelessWidget {
  late Widget nestScreen ;
  late String title ;
  late String imagePath ;
   DrawalTypeCard({Key? key,required this.nestScreen,required this.title ,required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return GestureDetector(
          onTap: () {
            ref.watch(aligmentrequestProvider).next(nestScreen);
          },
          child: Card(
              shadowColor: Colors.purple,
              color: Colors.amber,
              elevation: 20,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text( title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                subtitle: Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              )),
        );
      },
    );
  }
}
