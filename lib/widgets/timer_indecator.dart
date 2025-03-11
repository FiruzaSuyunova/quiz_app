import 'dart:async';
import 'package:flutter/material.dart';

class CircleTimer extends StatefulWidget {
  const CircleTimer({super.key});

  @override
  State<CircleTimer> createState() => _CircleTimerState();
}

class _CircleTimerState extends State<CircleTimer> {
  double progress = 1.0; // 100%
  int timeLeft = 20; // 20 sekund

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const duration = Duration(seconds: 1);
    Timer.periodic(duration, (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
          progress = timeLeft / 20; // Progressni kamaytirish
        });
      } else {
        timer.cancel(); // Vaqt tugadi
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: progress, // Kamayib boradigan progress
                strokeWidth: 10,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
            ),
            Text(
              '$timeLeft s',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

