import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:precoding_quiz/Services/admob_service.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({
    Key key,
  }) : super(key: key);

  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  final ams = AdMobService();

  @override
  void initState() {
    super.initState();
    Admob.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AdmobBanner(
        adSize: AdmobBannerSize.FULL_BANNER,
        adUnitId: ams.getAdMobAppId(),
      ),
    );
  }
}
