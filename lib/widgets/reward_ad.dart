import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:precoding_quiz/Services/admob_service.dart';

class RewardAdWidget extends StatefulWidget {
  @override
  _RewardAdWidgetState createState() => _RewardAdWidgetState();
}

class _RewardAdWidgetState extends State<RewardAdWidget> {
  final ams = AdMobService();

  AdmobReward reward;
  @override
  void initState() {
    super.initState();
    Admob.initialize();
    reward = AdmobReward(
      adUnitId: ams.getRewardedAdId(),
    );
    reward.load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: AdmobReward(
        //   adUnitId: ams.getRewardedAdId(),
        //   listener:
        // ),
        );
  }
}
