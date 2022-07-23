import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../features/user_balance/view/screens/balance_data_screen.dart';
import '../../../features/user_balance/view_model/current_user_balance.dart';
import '../../navication/bottom_navigation_bar.dart';
import '../../navication/navication.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BalanceDataScreen()),
                  );
                },
                icon:  const Icon(
                  Icons.monetization_on,
                  color: Colors.amber,
                ),
                label: CurrentUserBalanceViewModel(textStyle: const TextStyle(color: Colors.amber),),)
          ],
          leading: Image.asset(
            "assets/74668-win-animation.gif",
            height: 300.0,
            width: 300.0,
          ),
          backgroundColor: const Color.fromRGBO(11, 32, 73, 1),
          title: const Text("do and win"),
          centerTitle: true,
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://thumbs.gfycat.com/AchingSilkyFoal.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ref.watch(currentScreenProvider.state).state;
            },
          ),
        ));
  }
}
