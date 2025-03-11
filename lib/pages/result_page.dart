import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'livel_page.dart';

class Result extends StatelessWidget {
  final int score;
  final int wrong;

  const Result({super.key, required this.score, required this.wrong});

  @override
  Widget build(BuildContext context) {
    bool isPassed = score >= 6;
    int overall = score * 10;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Center(
              child: Stack(
                children: [
                  ///#oq container
                  Align(
                    alignment: Alignment(0, 2),
                    child: Container(
                      width: 700,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                spreadRadius: 0.5,
                                offset: Offset(0, 6))
                          ],
                          borderRadius: BorderRadius.circular(55)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 120),
                                    child: ListTile(
                                      title: Text(
                                        "$score",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Correct",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 130),
                                    child: ListTile(
                                      title: Text(
                                        "$wrong",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Icon(
                                        Icons.circle,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Wrong",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///#circle
                  Align(
                    alignment: Alignment(0, -0.38),
                    child: Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 50,
                              spreadRadius: 10,
                            )
                          ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(90)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Text(
                                  "Your Score ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.purpleAccent),
                                ),
                                Text("$overall",style: TextStyle(color: Colors.purpleAccent,fontSize:30 ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                ///#button play again
                ElevatedButton(
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(670, 72),
                      side: BorderSide(color: Colors.purpleAccent, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Play Again",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                ///#button show results
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(670, 72),
                      side: BorderSide(color: Colors.purpleAccent, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Show Results",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ///#pastki container
          Container(
              height: 85,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
            child: Center(
              child: Text("QUIZZLY",style:TextStyle(color: Colors.white,fontSize: 35),),
            )
          ),
        ],
      ),
    );
  }
}
