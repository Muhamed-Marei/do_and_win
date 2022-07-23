import 'package:cloud_firestore/cloud_firestore.dart';

class UserRegestrationModel {
  late String imageUrl, name, email, phone, uId;
  late int totalPoint,
      currentPoint,
      chargingPoints,
      taskPoint,
      inviteUsersPoint,
      givenPoint,
      watchVideoPoint;
  late bool block ;

  UserRegestrationModel(
      {required this.imageUrl,
      required this.name,
        required this.block,
      required this.email,
      required this.phone,
      required this.uId,
      required this.totalPoint,
      required this.currentPoint,
      required this.chargingPoints,
      required this.taskPoint,
      required this.inviteUsersPoint,
      required this.givenPoint,
      required this.watchVideoPoint});

  Map<String, dynamic> toMap() {
    return {
      'block': this.block ,
      'imageUrl': this.imageUrl,
      'name': this.name,
      'email': this.email,
      'phone': this.phone,
      'uId': this.uId,
      'totalPoint': this.totalPoint,
      'currentPoint': this.currentPoint,
      'chargingPoints': this.chargingPoints,
      'taskPoint': this.taskPoint,
      'inviteUsersPoint': this.inviteUsersPoint,
      'givenPoint': this.givenPoint,
      'watchVideoPoint': this.watchVideoPoint,
    };
  }

  factory UserRegestrationModel.fromMap(DocumentSnapshot doc) {
    dynamic map = doc.data();
    return UserRegestrationModel(
      block: map['block'] as bool  ,
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      uId: map['uId'] as String,
      totalPoint: map['totalPoint'] as int,
      currentPoint: map['currentPoint'] as int,
      chargingPoints: map['chargingPoints'] as int,
      taskPoint: map['taskPoint'] as int,
      inviteUsersPoint: map['inviteUsersPoint'] as int,
      givenPoint: map['givenPoint'] as int,
      watchVideoPoint: map['watchVideoPoint'] as int,
    );
  }
}
