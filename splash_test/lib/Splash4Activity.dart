import 'dart:async';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class Splash4Activity extends StatefulWidget {
  const Splash4Activity({super.key});

  @override
  Splash4ActivityState createState() => Splash4ActivityState();
}

class Splash4ActivityState extends State<Splash4Activity> {
  late Timer timer;
  int start = 30;

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (start > 0) {
          start--;
        } else {
          timer.cancel();
          navigateToNextScreen();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 20),
            Text(
              '$start',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

}
