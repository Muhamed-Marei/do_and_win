import 'package:flutter/material.dart';

class ViewBalanceCard extends StatelessWidget {
  late String title, subTitle;
  late IconData icon;
  ViewBalanceCard(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon,color: Colors.amber,),
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}
