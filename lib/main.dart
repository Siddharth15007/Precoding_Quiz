import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:precoding_quiz/constants.dart';
import 'package:precoding_quiz/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Precoding Quiz',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.poppinsTextTheme().apply(displayColor: kTextColor),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
