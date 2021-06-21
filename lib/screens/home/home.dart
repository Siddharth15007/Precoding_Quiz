import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:precoding_quiz/screens/quiz/quiz.dart';
import 'package:precoding_quiz/widgets/banner_ad.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "images/py.png",
    "images/java.png",
    "images/cpp.png",
    "images/linux.png",
    "images/js.png",
  ];

  Widget customCard(String langName, String image, int index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => GetJson(index)));
        },
        child: Material(
          color: Colors.indigo,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langName,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text("PRECODING QUIZ"),
      ),
      body: ListView(
        children: <Widget>[
          BannerAdWidget(),
          customCard("Python", images[0], 0),
          customCard("Java", images[1], 1),
          BannerAdWidget(),
          customCard("Cpp", images[2], 2),
          customCard("Linux", images[3], 3),
          BannerAdWidget(),
          customCard("JavaScript", images[4], 4),
        ],
      ),
      bottomNavigationBar: BannerAdWidget(),
      backgroundColor: Colors.grey[200],
    );
  }
}
