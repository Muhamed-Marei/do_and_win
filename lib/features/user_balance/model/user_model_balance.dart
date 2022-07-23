import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelBalance {
  late int totalPoint,
      currentPoint,
      chargingPoints,
      taskPoint,
      inviteUsersPoint,
      givenPoint,
      watchVideoPoint;

  UserModelBalance(
  {
    required this.totalPoint,
    required  this.currentPoint,
    required  this.chargingPoints,
    required  this.taskPoint,
    required  this.inviteUsersPoint,
    required  this.givenPoint,
    required  this.watchVideoPoint
});

  Map<String, dynamic> toMap() {
    return {
      'totalPoint': this.totalPoint,
      'currentPoint': this.currentPoint,
      'chargingPoints': this.chargingPoints,
      'taskPoint': this.taskPoint,
      'inviteUsersPoint': this.inviteUsersPoint,
      'givenPoint': this.givenPoint,
      'watchVideoPoint': this.watchVideoPoint,
    };
  }

  factory UserModelBalance.fromMap(DocumentSnapshot doc) {
    dynamic map = doc.data();
    return UserModelBalance(
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