import 'dart:math';

import '../model/questions.dart';

class Helper {
 static List<Question> generateQuestions(String level) {
    List<Question> questions = [];
    Random random = Random();

    for (int i = 0; i < 10; i++) {
      int num1 = random.nextInt(10) + 1;
      int num2 = random.nextInt(10) + 1;

      late String question;
      late int correctAnswer;
      ///#options
      List<int> options = [];

      switch (level) {
        case "Simple":
          int operation = random.nextInt(2);
          if (operation == 0) {
            question = "$num1 + $num2 =? ";
            correctAnswer = num1 + num2 ;
          } else {
            if (num1 < num2) {
              int something = num1;
              num1 = num2;
              num2 = something;
            }
            question = "$num1-$num2= ?";
            correctAnswer = num1 - num2;
          }
          break;

        case "Medium":
          int operation = random.nextInt(2);
          if (operation == 0) {
            question = "$num1 * $num2 = ?";
            correctAnswer = num1 * num2;
          } else {
            int dividend = num1 * num2;
            question = "$dividend : $num1 = ?";
            correctAnswer = dividend ~/ num1;
          }
          break;

        case "Difficult":
          int operation = random.nextInt(4);

          if (operation == 0) {
            question = "$num1 + $num2 = ?";
            correctAnswer = num1 + num2;
          } else if (operation == 1) {
            if (num1 < num2) {
              int something = num1;
              num1 = num2;
              num2 = something;
            }
            question = "$num1 - $num2 = ?";
            correctAnswer = num1 - num2;
          } else if (operation == 2) {
            question = "$num1 x $num2 = ?";
            correctAnswer = num1 * num2;
          } else {
            int dividend = num1 * num2;
            question = "$dividend : $num1 = ?";
            correctAnswer = dividend ~/ num1;
          }
          break;

        default:
          question = "";
          correctAnswer = 0;
      }

      options.add(correctAnswer);
      while(options.length<4){
        int  randomOptions=random.nextInt(20)+1;
        if(!options.contains(randomOptions))options.add(randomOptions);
      }
      options.shuffle();
      questions.add(Question(question: question, options: options, correctAnswer: correctAnswer));
    }
    return questions;
  }
}
