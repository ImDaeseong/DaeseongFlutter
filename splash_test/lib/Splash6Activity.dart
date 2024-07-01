import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class Splash6Activity extends StatefulWidget {
  const Splash6Activity({super.key});

  @override
  Splash6ActivityState createState() => Splash6ActivityState();
}

class Splash6ActivityState extends State<Splash6Activity> {

  final Random random = Random();
  late int res;

  @override
  void initState() {
    super.initState();

    res = random.nextInt(4);

    Timer(const Duration(seconds: 5), () {
      navigateToNextScreen();
    });
  }

  String getDrawableResource() {
    switch(res) {
      case 0:
        return 'assets/images/number1.png';
      case 1:
        return 'assets/images/number2.png';
      case 2:
        return 'assets/images/number3.png';
      case 3:
        return 'assets/images/number4.png';
      default:
        return 'assets/images/number1.png';
    }
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
          children: [
            Container(
              width: 187,
              height: 128,
              margin:  const EdgeInsets.only(top: 156),
              child: Image.asset(
                'assets/images/instar.jpg', // Make sure you have this image in your assets
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 61,
              height: 42,
              margin: const EdgeInsets.only(bottom: 84),
              child: Image.asset(
                getDrawableResource(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
