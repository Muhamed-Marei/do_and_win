import 'package:flutter/material.dart';
import '../../../features/admob/view/banner_ad_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [

        BannerAdsWidget() ,
      ],
    );
  }
}
//currentScreenProvider
