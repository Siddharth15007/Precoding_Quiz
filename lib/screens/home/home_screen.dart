import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:precoding_quiz/components/app_bar.dart';
import 'package:precoding_quiz/screens/home/components/body.dart';
import 'package:precoding_quiz/services/admob_service.dart';
import 'package:precoding_quiz/size_config.dart';
import 'package:precoding_quiz/widgets/banner_ad.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future<InitializationStatus> _initGoogleMobileAds() {
      return MobileAds.instance.initialize();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

      //bottomNavigationBar: AdsBanner(),

      // Column(
      //   children: [
      //     if (_isBannerAdReady)
      //       Align(
      //         alignment: Alignment.bottomLeft,
      //         child: Container(
      //           width: _bannerAd.size.width.toDouble(),
      //           height: _bannerAd.size.height.toDouble(),
      //           child: AdWidget(ad: _bannerAd),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
