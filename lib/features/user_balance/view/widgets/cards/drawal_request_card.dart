import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DrawallRequestCard extends StatelessWidget {
  late DocumentSnapshot document ;
  late  Map<String, dynamic> data ;
  DrawallRequestCard({Key? key, required this.document}) : super(key: key){
    data  = document.data()! as Map<String, dynamic>;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('no data',style: TextStyle(color: Colors.black),),
        subtitle: Text(data['uid']),
      ),
    );
  }
}
