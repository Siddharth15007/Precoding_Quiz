import 'package:flutter/material.dart';
import 'package:precoding_quiz/services/admob_service.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({
    Key key,
  }) : super(key: key);

  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  final ams = AdmobService();
  // QuestionController _questionController = Get.put(QuestionController());

  // @override
  // void initState() {
  //   super.initState();
  //   //Admob.initialize();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: AdmobBanner(
        //   adSize: AdmobBannerSize.FULL_BANNER,
        //   adUnitId: ams.getbannerAdUnitId(),
        // ),
        );
  }
}
