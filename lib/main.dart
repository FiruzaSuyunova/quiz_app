

import 'package:flutter/material.dart';
import 'package:for_practice/pages/livel_page.dart';


void main(){

  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LevelPage(),
    );
  }
}


