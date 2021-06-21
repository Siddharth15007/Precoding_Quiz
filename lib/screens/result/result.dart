import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:precoding_quiz/Services/admob_service.dart';
import 'package:precoding_quiz/screens/home/home.dart';
import 'package:precoding_quiz/widgets/banner_ad.dart';

class ResultPage extends StatefulWidget {
  var marks;
  ResultPage({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState(marks);
}

class _ResultPageState extends State<ResultPage> {
  final ams = AdMobService();
  AdmobReward reward;
  int marks;
  String marksString;
  Color marksStringColor;
  String tmpMarkImage;
  List<String> marksImage = [
    "images/good.png",
    "images/bad.png",
    "images/success.png",
  ];
  _ResultPageState(this.marks);

  @override
  void initState() {
    if (marks > 18) {
      marksString = "Congratulation, You Scored $marks marks";
      marksStringColor = Colors.green;
      tmpMarkImage = marksImage[2];
    } else {
      marksString = "Oops!! You Scored only $marks marks";
      marksStringColor = Colors.red;
      tmpMarkImage = marksImage[1];
    }
    super.initState();
    reward = AdmobReward(
        adUnitId: ams.getRewardedAdId(),
        listener: (event, args) {
          if (event == AdmobAdEvent.rewarded) {
            print("");
          }
        });
    reward.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRECODING QUIZ"),
      ),
      body: Column(
        children: <Widget>[
          //Admob Ads
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              child: BannerAdWidget(),
            ),
          ),
          Expanded(
            flex: 6,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 150.0,
                        height: 150.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(tmpMarkImage),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 5.0),
                      child: Center(
                        child: Text(
                          marksString,
                          style: TextStyle(
                              color: marksStringColor,
                              fontSize: 20.0,
                              fontFamily: "Alike"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //Admob Ads
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              child: BannerAdWidget(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: deprecated_member_use
                OutlineButton(
                  onPressed: () async {
                    if (await reward.isLoaded) {
                      reward.load();
                    }
                    //AdMobService.showRewardedAd();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 3.0),
                  splashColor: Colors.green,
                )
              ],
            ),
          ),
          //Admob Ads
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              child: BannerAdWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
