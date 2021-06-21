import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precoding_quiz/constants.dart';
import 'package:precoding_quiz/controllers/question_controller.dart';
import 'package:precoding_quiz/models/Questions.dart';
import 'package:precoding_quiz/screens/quiz/components/options.dart';
import 'package:precoding_quiz/size_config.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: defaultSize * 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                question.question,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                height: defaultSize / 2,
              ),
              ...List.generate(
                question.options.length,
                (index) => Options(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAns(question, index),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
