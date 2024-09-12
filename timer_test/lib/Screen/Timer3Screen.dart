import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Timer3Screen extends StatefulWidget {
  const Timer3Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Timer3ScreenState();
  }
}

class Timer3ScreenState extends State<Timer3Screen> {

  Timer? timer;
  int secondsElapsed = 0;
  bool isRunning = false;

  void startTimer() {

    // 타이머가 실행 중이면 정지 후 재시작
    if(isRunning) {
      stopTimer();
    }

    setState(() {
      isRunning = true;
      secondsElapsed = 0;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        secondsElapsed++;
      });
    });
  }

  void stopTimer() {
    if(isRunning) {
      timer?.cancel();

      setState(() {
        isRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Timer3Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              '타이머: $secondsElapsed 초 경과',
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF9900),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: startTimer,
              child: const Text('시작'),
            ),
            
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}