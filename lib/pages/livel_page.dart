import 'package:flutter/material.dart';
import 'quiz_page.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});
///# level page interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "QUIZZLY",
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
                SizedBox(
                  height: 110,
                ),
                Text(
                  "Welcome to quizzly",
                  style: TextStyle(color: Colors.white24, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "With quizzly you can improve \n your thinking ,intelligence and \n logical skills ",
                  style: TextStyle(color: Colors.white24, fontSize: 25),
                )
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Text("Choose the appropriate level...",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                LevelButton(title: "Level 1", level: "Simple"),
                SizedBox(height: 6),
                LevelButton(title: "Level 2", level: "Medium"),
                SizedBox(height: 6),
                LevelButton(title: "Level 3", level: "Difficult"),
              ],
            )
          ],
        ),
        
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final String level;
  final String title;

  const LevelButton({super.key, required this.title, required this.level});
///# livel page buttons
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 60),
              backgroundColor: Colors.purpleAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.white, width: 3))),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuizPage(level: level)));
          },
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }



}
