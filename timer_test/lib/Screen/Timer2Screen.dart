import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Timer2Screen extends StatefulWidget {
  const Timer2Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Timer2ScreenState();
  }
}

class Timer2ScreenState extends State<Timer2Screen> {

  Timer? timer;
  int secondsRemaining = 0;
  final int timerDuration = 60;// 1분

  void startTimer() {
    setState(() {
      secondsRemaining = timerDuration;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {

      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer?.cancel();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('타이머 완료')),
        );
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      secondsRemaining = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Timer2Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              '타이머: $secondsRemaining 초 남음',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF9900),
              ),
              textAlign: TextAlign.center,
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