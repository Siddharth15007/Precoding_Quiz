import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precoding_quiz/components/app_bar.dart';
import 'package:precoding_quiz/components/body_background.dart';
import 'package:precoding_quiz/constants.dart';
import 'package:precoding_quiz/controllers/question_controller.dart';
import 'package:precoding_quiz/screens/home/home_screen.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    Color scoreColor;
    String scoreString;
    QuestionController _qnController = Get.put(QuestionController());
    if (_qnController.numOfCorrectAns <= 60) {
      scoreColor = Colors.red.shade900;
      scoreString = "Oops";
    } else {
      scoreColor = Colors.green.shade900;
      scoreString = "Congratulations";
    }
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          BodyBackground(),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Result",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "$scoreString ! Your Total Score is ${_qnController.numOfCorrectAns * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: scoreColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Get.to(HomeScreen()), //{
                //   Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(
                //       builder: (context) => HomeScreen(),
                //     ),
                //   );
                // },
                child: Container(
                  height: 50,
                  width: 230,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Play Again",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
