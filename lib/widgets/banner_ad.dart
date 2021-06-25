import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:precoding_quiz/Services/admob_service.dart';

class AdsBanner extends StatefulWidget {
  const AdsBanner({Key key}) : super(key: key);

  @override
  _AdsBannerState createState() => _AdsBannerState();
}

class _AdsBannerState extends State<AdsBanner> {
  // TODO: Add _bannerAd
  BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdmobService.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();

    super.dispose();
  }

  displayBannerAds() {
    if (_isBannerAdReady) {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: _bannerAd.size.width.toDouble(),
          height: _bannerAd.size.height.toDouble(),
          child: AdWidget(
            ad: _bannerAd,
            key: Key("Admob#1"),
          ),
        ),
      );
    } else {
      return Center(
        child: Text("AD"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: displayBannerAds(),
    );
  }
}
