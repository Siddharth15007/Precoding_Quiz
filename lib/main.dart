import 'package:flutter/material.dart';
import 'package:precoding_quiz/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Programming Quiz",
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: SplashScreen(),
    );
  }
}
