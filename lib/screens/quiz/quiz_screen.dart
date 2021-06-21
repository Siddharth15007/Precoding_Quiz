import 'package:flutter/material.dart';
import 'package:precoding_quiz/components/app_bar.dart';
import 'package:precoding_quiz/screens/quiz/components/body.dart';
import 'package:precoding_quiz/size_config.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
