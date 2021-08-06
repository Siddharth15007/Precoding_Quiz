import 'package:flutter/material.dart';
import 'package:precoding_quiz/components/app_bar.dart';
import 'package:precoding_quiz/screens/home/components/body.dart';
import 'package:precoding_quiz/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
