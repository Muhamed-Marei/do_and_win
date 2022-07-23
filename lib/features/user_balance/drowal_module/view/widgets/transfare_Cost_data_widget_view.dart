import 'package:flutter/material.dart';

import '../../../../../style and animation/text/text_animation.dart';
class TransfareCostDataAndTypeWidget extends StatelessWidget {
  late String title ;
  late String numberOfPoint ;
  late String cost ;
  late String costType;
  late Widget icon ;
   TransfareCostDataAndTypeWidget({Key? key,required this.title ,required this.cost ,required this.costType , required this.numberOfPoint, required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextAnimation(
                  fontSize: 20,
                  text: title ,
                ),
              ],
            )),
        IconButton(
          iconSize: 55,
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return  AlertDialPointsCost(Data: "$numberOfPoint point = $cost $costType ",);
                },
              );
            },
            icon: icon)
      ],
    );
  }
}

class AlertDialPointsCost extends StatelessWidget {
  late String Data ;
   AlertDialPointsCost({Key? key,required this.Data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topRight,
      content: Text(Data),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "تم",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
