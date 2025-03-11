import 'dart:async';
import 'package:flutter/material.dart';
import 'package:for_practice/pages/result_page.dart';
import '../helpers/helper.dart';
import '../model/questions.dart';
import '../widgets/timer_indecator.dart';

class QuizPage extends StatefulWidget {
  final String level;

  const QuizPage({super.key, required this.level});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  late List<Question> questions;
  int currentIndex = 0;
  int score = 0;
  int wrong = 0;
  late Timer timer;
  int time = 20;

  @override
  void initState() {
    super.initState();
    questions = Helper.generateQuestions(widget.level);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() => time--);
      } else {
        nextQuestion();
      }
    });
  }

  void checkAnswer(int answer) {
    if (questions[currentIndex].correctAnswer == answer) {
      score++;
    } else {
      wrong++;
    }
    nextQuestion();
  }

  void nextQuestion() {
    if (currentIndex < 9) {
      setState(() {
        currentIndex++;
        time = 20;
      });
    } else {
      timer.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Result(score: score, wrong: wrong),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
       children: [
         Column(
           children: [
             ///#purple container
             Container(
               height: 250,
               decoration: BoxDecoration(
                   color: Colors.purpleAccent,
                   borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(45),
                       bottomLeft: Radius.circular(45))),
               child: Stack(
                 children: [
                   ///#oq container
                   Align(
                     alignment: Alignment(0, 4),
                     child: Container(
                       width: 500,
                       height: 200,
                       decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16)),
                       child: Center(
                         child: Text("Question ${currentIndex + 1} of 10",
                             style: TextStyle(fontSize: 18)),
                       ),
                     ),
                   ),
                   ///#Circular indecator
                   Align(
                     alignment: Alignment(0, -0.38),
                     child: Center(
                       child: ClipOval(
                         child: Container(
                           height: 80,
                           width: 80,
                           decoration: BoxDecoration(color: Colors.white),
                           child:  CircleTimer()
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
         ///# pastki buttonlar
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 20),
             Text(questions[currentIndex].question,
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
             SizedBox(height: 50),
             ...questions[currentIndex].options.map((option) {
               return Padding(
                 padding: const EdgeInsets.all(18),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     minimumSize: Size(480, 70),
                     backgroundColor: Colors.white,
                     foregroundColor: Colors.purple,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                       side: BorderSide(color: Colors.purpleAccent,width: 3)
                     )
                   ),
                   onPressed: () => checkAnswer(option),
                   child: Text("$option", style: TextStyle(fontSize: 20,color: Colors.black)),
                 ),
               );
             }),
              SizedBox(height: 40),
              ///#pastdagi purple container
              Container(
                height: 70,
                decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(30))),
              )
           ],
         ),
       ],
     ),
    );

  }
}


