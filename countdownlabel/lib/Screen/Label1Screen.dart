import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../Widget/CountdownText.dart';

class Label1Screen extends StatefulWidget {
  const Label1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Label1ScreenState();
  }
}

class Label1ScreenState extends State<Label1Screen> {

  Timer? timer;
  int nSeconds = 10;
  bool isBlinking = false;

  void startTimer() {

    setState(() {
      nSeconds = 10;
      isBlinking = true;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {

      if (nSeconds > 0) {

        setState(() {
          nSeconds--;
          isBlinking = !isBlinking;
        });

      } else {

        timer.cancel();
        setState(() {
          isBlinking = false;
        });

      }

    });
  }

  void stopTimer() {

    setState(() {
      timer?.cancel();
      isBlinking = false;
    });
  }

  @override
  void initState() {
    super.initState();

    print("State가 초기화되었습니다.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Label1Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CountdownText(
              nSeconds: nSeconds,
              isBlinking: isBlinking,
            ),

            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: const Text('시작'),
                ),

                const SizedBox(width: 20),
                
                ElevatedButton(
                    onPressed: (){
                      stopTimer();
                    },
                    child: const Text('종료'),
                ),
                
              ],
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