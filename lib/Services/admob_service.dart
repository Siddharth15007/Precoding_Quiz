import 'dart:io';

class AdMobService {
  String getAdMobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8601164477138947~8900261560';
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8601164477138947/6895902993';
    }
    return null;
  }

  String getRewardedAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8601164477138947/7469251083';
    }
    return null;
  }

  // static String get bannerAdUnitId => Platform.isAndroid
  //     ? 'ca-app-pub-8601164477138947/6895902993'
  //     : 'ca-app-pub-8601164477138947/6895902993';

  // static String get rewardedAdUnitId => Platform.isAndroid
  //     ? 'ca-app-pub-8601164477138947/7469251083'
  //     : 'ca-app-pub-8601164477138947/7469251083';

  // static initialize() {
  //   if (MobileAds.instance == null) {
  //     MobileAds.instance.initialize();
  //   }
  // }

  // static BannerAd createBannerAd() {
  //   BannerAd ad = new BannerAd(
  //       size: AdSize.banner,
  //       adUnitId: bannerAdUnitId,
  //       listener: AdListener(
  //         onAdLoaded: (Ad ad) => print("Ad Loaded"),
  //         onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //           ad.dispose();
  //         },
  //         onAdOpened: (Ad ad) => print("Ad Opened"),
  //         onAdClosed: (Ad ad) => print("Ad Closed"),
  //       ),
  //       request: AdRequest());
  //   return ad;
  // }

  // static RewardedAd _rewardedAd;
  // static RewardedAd _createRewardedAd() {
  //   return RewardedAd(
  //       adUnitId: rewardedAdUnitId,
  //       listener: AdListener(
  //         onAdLoaded: (Ad ad) => {_rewardedAd.show()},
  //         onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //           ad.dispose();
  //         },
  //         onAdOpened: (Ad ad) => print("Ad Opened"),
  //         onAdClosed: (Ad ad) => {_rewardedAd.dispose()},
  //         onApplicationExit: (Ad ad) => {_rewardedAd.dispose()},
  //       ),
  //       request: AdRequest());
  // }

  // static void showRewardedAd() {
  //   _rewardedAd?.dispose();
  //   _rewardedAd = null;
  //   if (_rewardedAd == null) _rewardedAd = _createRewardedAd();
  //   _rewardedAd.load();
  // }
}
