import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Toolbar1Screen.dart';
import 'Toolbar2Screen.dart';
import 'Toolbar3Screen.dart';
import 'Toolbar4Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('toolbar_test'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Toolbar1Screen());
              },
              child: const Text('Button1'),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Toolbar2Screen());
              },
              child: const Text('Button2'),
            ),

            const SizedBox(height: 50),


            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Toolbar3Screen());
              },
              child: const Text('Button3'),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Toolbar4Screen());
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