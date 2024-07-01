import 'dart:async';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class Splash5Activity extends StatefulWidget {
  const Splash5Activity({super.key});

  @override
  Splash5ActivityState createState() => Splash5ActivityState();
}

class Splash5ActivityState extends State<Splash5Activity> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();


    Timer(const Duration(seconds: 5), () {
      navigateToNextScreen();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeInFadeOut,
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 1.1).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.decelerate,
                  ),
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
