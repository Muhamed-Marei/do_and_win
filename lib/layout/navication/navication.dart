import 'package:do_and_win/layout/view/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/admob/provider/ad_helper.dart';
import '../../features/admob/view/rewarded_ad_widget.dart';
import '../../features/user_profile/view/screens/user_profile.dart';

StateProvider currentScreenProvider = StateProvider((ref) {
  return root[ref.watch(selectedScreenProvider.state).state]["screen"];
});

StateProvider selectedScreenProvider = StateProvider<int>((ref) {
  return 1;
});
List<Widget> screensIconList = [
  const Icon(
    Icons.monetization_on,
    size: 30,
    color: Colors.amber,
  ),
  const Icon(
    Icons.home,
    size: 30,
    color: Colors.amber,
  ),
  const Icon(
    Icons.account_circle_outlined,
    size: 30,
    color: Colors.amber,
  ),
];
List<Map<String, dynamic>> root = [
  {
    "title": "prodact",
    "screen": RewardedAdWidget(rewardedAdID: AdHelper.rewardedAdID,),
    "icon": const Icon(Icons.shopping_basket)
  },
  {
    "title": "Service",
    "screen": HomePage(),
    "icon": const Icon(Icons.home_filled)
  },
  {
    "title": "portfolio",
    "screen": UserProfileScreen(),
    "icon": const Icon(Icons.account_circle_outlined)
  },
];
