import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:precoding_quiz/controllers/question_controller.dart';
import 'package:precoding_quiz/size_config.dart';

class Options extends StatelessWidget {
  const Options({
    Key key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        TextStyle getRightStyle() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
                fontSize: 18,
              );
              // return Colors.green.shade900;
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
                fontSize: 18,
              );
              // return Colors.red.shade900;
            }
          }
          return TextStyle(
            color: Colors.black,
            fontSize: 16,
          );
          // return Colors.black;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: defaultSize * 1,
            ),
            padding: EdgeInsets.all(defaultSize * 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "${index + 1}. $text",
                    style: getRightStyle(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//paste
