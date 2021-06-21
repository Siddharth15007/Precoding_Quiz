import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precoding_quiz/constants.dart';
import 'package:precoding_quiz/controllers/question_controller.dart';
import 'package:precoding_quiz/size_config.dart';

class ProgressTimer extends StatelessWidget {
  const ProgressTimer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor,
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultSize / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(controller.animation.value * 60).round()}",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
