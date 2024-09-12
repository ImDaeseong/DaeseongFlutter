import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Timer1Screen extends StatefulWidget {
  const Timer1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Timer1ScreenState();
  }
}

class Timer1ScreenState extends State<Timer1Screen> {

  Timer? timer;
  int nTimeCount = 0;
  String displayText = '';

  void startTimer() {
    closeTimer();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        nTimeCount++;
        displayText = '$nTimeCount';

        //3분까지만
        if (nTimeCount > 180) {
          closeTimer();
          displayText = '완료';
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('타이머 완료')),
          );
        }

      });

    });

  }

  void closeTimer() {
    timer?.cancel();
    timer = null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer1Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              displayText,
              style: const TextStyle(
                fontSize: 15,
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
    closeTimer();
    super.dispose();
  }
}