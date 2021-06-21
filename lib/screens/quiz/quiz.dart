import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:precoding_quiz/Services/admob_service.dart';
import 'package:precoding_quiz/screens/result/result.dart';
import 'package:precoding_quiz/widgets/banner_ad.dart';

class GetJson extends StatelessWidget {
  int index;
  GetJson(this.index);

  var dataStringList = [
    "assets/python.json",
    "assets/java.json",
    "assets/cpp.json",
    "assets/linux.json",
    "assets/js.json",
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(dataStringList[index]),
      builder: (context, snapchat) {
        List myData = json.decode(snapchat.data.toString());
        if (myData == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
            bottomNavigationBar: Container(
              height: 50.0,
              child: BannerAdWidget(),
            ),
            backgroundColor: Colors.grey[200],
          );
        } else {
          return QuizPage(myData: myData);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  var myData;
  QuizPage({Key key, @required this.myData}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState(myData);
}

class _QuizPageState extends State<QuizPage> {
  var myData;
  _QuizPageState(this.myData);

  Color colorToShow = Colors.blueAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTimer = "30";

  bool cancelTimer = false;

  Map<String, Color> btnColor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    var oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer -= 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void nextQuestion() {
    cancelTimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResultPage(marks: marks)));
      }

      btnColor["a"] = Colors.indigoAccent;
      btnColor["b"] = Colors.indigoAccent;
      btnColor["c"] = Colors.indigoAccent;
      btnColor["d"] = Colors.indigoAccent;
    });
    startTimer();
  }

  void checkAnswer(String option) {
    if (myData[2]["1"] == myData[1]["1"][option]) {
      marks += 5;
      colorToShow = right;
    } else {
      marks = (marks > 3) ? marks - 3 : 0;
      colorToShow = wrong;
    }
    setState(() {
      btnColor[option] = colorToShow;
      cancelTimer = true;
    });

    Timer(Duration(seconds: 2), nextQuestion);
  }

  Widget choicebutton(String option) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        color: btnColor[option],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 40.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        onPressed: () => checkAnswer(option),
        child: Text(
          myData[1][i.toString()][option],
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontFamily: "Alike"),
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Programming Quiz"),
                    content: Text("You can't go back at this step."),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "OK",
                        ),
                      )
                    ],
                  ));
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("PRECODING QUIZ"),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      myData[0][i.toString()],
                      style: TextStyle(fontSize: 18.0, fontFamily: "Quando"),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choicebutton("a"),
                      choicebutton("b"),
                      choicebutton("c"),
                      choicebutton("d"),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(showTimer,
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Times New Roman")),
                ),
              ),
            ],
          ),
        ));
  }
}
