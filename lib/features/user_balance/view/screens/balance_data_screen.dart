import 'package:flutter/material.dart';
import '../../../../style and animation/text/text_animation.dart';
import '../../view_model/user_balance_view_model.dart';
class BalanceDataScreen extends StatelessWidget {
  const BalanceDataScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TextAnimation(
            fontSize: 35,
            text: 'محفظتك',
          ),
          backgroundColor: const Color.fromRGBO(11, 32, 73, 1),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://thumbs.gfycat.com/AchingSilkyFoal.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: const UserBalanceViewModel(),
        ),
      ),
    );
  }
}
