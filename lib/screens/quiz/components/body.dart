import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precoding_quiz/constants.dart';
import 'package:precoding_quiz/controllers/question_controller.dart';
import 'package:precoding_quiz/screens/quiz/components/progress_timer.dart';
import 'package:precoding_quiz/screens/quiz/components/question_card.dart';
import 'package:precoding_quiz/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultSize),
                      child: Obx(
                        () => Text.rich(
                          TextSpan(
                            text:
                                "Question ${_questionController.questionNumber.value}",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: kSecondaryColor,
                                    ),
                            children: [
                              TextSpan(
                                text:
                                    "/${_questionController.questions.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: kSecondaryColor,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ProgressTimer(),
                  ],
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
