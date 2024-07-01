import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class Splash2Activity extends StatefulWidget {
  const Splash2Activity({super.key});

  @override
  Splash2ActivityState createState() => Splash2ActivityState();
}

class Splash2ActivityState extends State<Splash2Activity> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      navigateToNextScreen();
    });
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //background image
          Positioned.fill(
              child: Image.asset(
                'assets/images/splashbg.jpg',
                fit: BoxFit.cover,
              ),
          ),

          Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: 30,
            right: 20,
            child: GestureDetector(
              onTap: () {
                navigateToNextScreen();
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),

            ),

          ),
        ],
      ),
    );
  }
}