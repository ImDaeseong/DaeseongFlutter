import 'dart:async';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class Splash3Activity extends StatefulWidget {
  const Splash3Activity({super.key});

  @override
  Splash3ActivityState createState() => Splash3ActivityState();
}

class Splash3ActivityState extends State<Splash3Activity> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      navigateToNextScreen();
    });
  }

  @override
  void dispose() {

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
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
                'assets/images/splashbg.jpg',
                fit: BoxFit.cover,
              ),
          ),
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
      ),
    );
  }
}
