import 'dart:async';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SharedPreferencesUtil.dart';

class Splash1Activity extends StatefulWidget {
  const Splash1Activity({super.key});

  @override
  Splash1ActivityState createState() => Splash1ActivityState();
}

class Splash1ActivityState extends State<Splash1Activity> {

  @override
  void initState() {
    super.initState();
    initSplash();
  }

  Future<void> initSplash() async {

    bool isFirst = await SharedPreferencesUtil.getValue('FIRST', false) ?? false;

    Timer(const Duration(seconds: 1), () {
      if (isFirst) {
        print('Second');
      } else {
        print('First');
        SharedPreferencesUtil.setValue('FIRST', true);
      }
      navigateToNextScreen();
    });
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
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splashbg.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: TextButton(
              onPressed: () {
                print('skip');
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
