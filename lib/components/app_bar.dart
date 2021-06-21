import 'package:flutter/material.dart';
import 'package:precoding_quiz/constants.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black45,
    ),
    title: Center(
      child: Text(
        "Precoding Quiz",
        style: TextStyle(
          color: kTextColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
