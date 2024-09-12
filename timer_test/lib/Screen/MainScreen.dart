import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Timer1Screen.dart';
import 'Timer2Screen.dart';
import 'Timer3Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('timer_test'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Timer1Screen());
              },
              child: const Text('button1'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Timer2Screen());
              },
              child: const Text('button2'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Timer3Screen());
              },
              child: const Text('button3'),
            ),
          ],
        ),

      ),

    );
  }

  void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

}