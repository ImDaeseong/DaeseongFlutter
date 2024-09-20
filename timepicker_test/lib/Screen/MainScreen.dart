import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Timepicker1Screen.dart';
import 'Timepicker2Screen.dart';
import 'Timepicker3Screen.dart';
import 'Timepicker4Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('timepicker_test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Timepicker1Screen());
              },
              child: const Text('Button1'),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Timepicker2Screen());
              },
              child: const Text('Button2'),
            ),

            const SizedBox(height: 50),


            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Timepicker3Screen());
              },
              child: const Text('Button3'),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Timepicker4Screen());
              },
              child: const Text('Button4'),
            ),

            const SizedBox(height: 50),

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