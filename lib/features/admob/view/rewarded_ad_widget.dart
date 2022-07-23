import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../provider/ad_helper.dart';
//AdHelper.rewardedAdID
class RewardedAdWidget extends StatefulWidget {
  late String rewardedAdID ;
   RewardedAdWidget({Key? key , required this.rewardedAdID }) : super(key: key);
  @override
  State<RewardedAdWidget> createState() => _RewardedAdWidgetState();
}
class _RewardedAdWidgetState extends State<RewardedAdWidget> {
  late RewardedAd _rewardedAd;
  var _blance = 20;
  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: widget.rewardedAdID ,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                ad.dispose();
              });
              _loadRewardedAd();
            },
          );
          setState(() {
            _rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }
  void _showRewardedAd() {
    _rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem item) {
      setState(() {
        _blance += item.amount.toInt();
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadRewardedAd();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            _blance.toString(),
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              _showRewardedAd();
            },
            child: const Text(" click me"),
          ),
        ),
      ],
    );
  }
}

