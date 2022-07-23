import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../provider/ad_helper.dart';

class BannerAdsWidget extends StatefulWidget {
  const BannerAdsWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdsWidget> createState() => _BannerAdsWidgetState();
}

class _BannerAdsWidgetState extends State<BannerAdsWidget> {
  @override
  void initState() {
    super.initState();
    myBanner.load();
  }

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    super.dispose();
    myBanner.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return myBanner != null
        ? Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: myBanner.size.height.toDouble(),
            child: bannerAdWidget,
          )
        : Container(
            color: Colors.indigo,
            alignment: Alignment.center,
            width: 100,
            height: 50,
          );
  }
}

final BannerAd myBanner = BannerAd(
  adUnitId: AdHelper.bannerAdUnitId,
  size: AdSize.banner,
  request: const AdRequest(),
  listener: listener,
);
final AdWidget bannerAdWidget = AdWidget(ad: myBanner);

final BannerAdListener listener = BannerAdListener(
  // Called when an ad is successfully received.
  onAdLoaded: (Ad ad) => print('Ad loaded.'),
  // Called when an ad request failed.
  onAdFailedToLoad: (Ad ad, LoadAdError error) {
    // Dispose the ad here to free resources.
    ad.dispose();
    print('Ad failed to load: $error');
  },
  // Called when an ad opens an overlay that covers the screen.
  onAdOpened: (Ad ad) => print('Ad opened.'),
  // Called when an ad removes an overlay that covers the screen.
  onAdClosed: (Ad ad) => print('Ad closed.'),
  // Called when an impression occurs on the ad.
  onAdImpression: (Ad ad) => print('Ad impression.'),
);
