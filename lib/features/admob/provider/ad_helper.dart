import 'dart:io';

class AdHelper {
  static bool _testMode = true;

  static String get bannerAdUnitId {
    if (_testMode == true) {
      return "ca-app-pub-3940256099942544/6300978111"; // for test mood
    } else if (Platform.isAndroid) {
      return "ca-app-pub-1056836010359902/6898474594"; //
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdID {
    if (_testMode == true) {
      return "ca-app-pub-3940256099942544/5224354917"; // for test mood
    } else if (Platform.isAndroid) {
      return "ca-app-pub-1056836010359902/6898474594"; //
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (_testMode == true) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isAndroid) {
      return "cca-app-pub-1056836010359902/8651659524"; // ToDo ad you android ad Id hear that is my Id
    } else if (Platform.isIOS) {
      return "--------------------------------------";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
