import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../Widget/CountdownWidget.dart';

class Label2Screen extends StatefulWidget {
  const Label2Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Label2ScreenState();
  }
}

class Label2ScreenState extends State<Label2Screen> with SingleTickerProviderStateMixin {

  int nCount = 0;
  Timer? timer;
  late AnimationController animationController;
  late Animation<double> animation;

  void startTimer() {
    stopTimer();
    nCount = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {

      if (nCount > 0) {

        setState(() {
          nCount--;
        });

        animationController.forward(from: 0);

      } else {

        stopTimer();

      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    animationController.stop();
    animationController.reset();
    setState(() {
      nCount = 10;
    });
  }


  @override
  void initState() {
    super.initState();

    print("State가 초기화되었습니다.");

    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween<double>(begin: 1, end: 0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Label2Screen'),
      ),

      body: Center(
        child: CountdownWidget(
          nCount: nCount,
          dOpacity: animation.value,
          onStart: startTimer,
          onStop: stopTimer,
        ),
      ),
    );
  }

}