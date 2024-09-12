import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Label1Screen.dart';
import 'Label2Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('countdownlabel'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                onPressed: () {
                  navigateTo(context, const Label1Screen());
                },
                child: const Text('Button1'),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
                onPressed: () {
                  navigateTo(context, const Label2Screen());
                },
                child: const Text('Button2'),
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