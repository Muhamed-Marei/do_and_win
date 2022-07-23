import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserModel {
  late String imageUrl, name, email, phone;
  UpdateUserModel({
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UpdateUserModel.fromMap(DocumentSnapshot doc) {
    dynamic map = doc.data();
    return UpdateUserModel(
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }
}
