import 'package:flutter/material.dart';
import '../../view_model/user_data_view_model.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserProfileViewModel(),
    );
  }
}
