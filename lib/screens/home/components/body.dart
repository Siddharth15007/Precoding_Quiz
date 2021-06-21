import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precoding_quiz/components/body_background.dart';
import 'package:precoding_quiz/controllers/question_controller.dart';
import 'package:precoding_quiz/screens/home/components/subject_card.dart';
import 'package:precoding_quiz/size_config.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> images = [
    "assets/images/py.png",
    "assets/images/java.png",
    "assets/images/cpp.png",
    "assets/images/linux.png",
    "assets/images/js.png",
  ];

  List<String> subName = [
    "Python",
    "Java",
    "C++",
    "Linux",
    "Java Script",
  ];

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    double defaultSize = SizeConfig.defaultSize;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                BodyBackground(),

                //SubjectCard(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultSize,
                    vertical: defaultSize,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          SizeConfig.orientation == Orientation.portrait
                              ? 2
                              : 3,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 0.850,
                    ),
                    itemBuilder: (context, index) => SubjectCard(
                      index: index,
                      subTitle: subName[index],
                      image: AssetImage(images[index]),
                      press: () => _questionController.getJson(index),
                      // Get.to(
                      //   QuizScreen(),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
