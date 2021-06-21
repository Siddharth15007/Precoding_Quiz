import 'package:flutter/material.dart';
import 'package:precoding_quiz/size_config.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    Key key,
    @required this.press,
    @required this.image,
    @required this.subTitle,
    @required this.index,
  }) : super(key: key);

  final Function press;
  final AssetImage image;
  final String subTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultSize,
          vertical: defaultSize,
        ),
        padding: EdgeInsets.all(20),
        height: 150,
        width: defaultSize * 15,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Image(image: image),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultSize,
                ),
                child: Container(
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
