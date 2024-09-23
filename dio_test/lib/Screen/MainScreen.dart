import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dio1Screen.dart';
import 'Dio2Screen.dart';
import 'Dio3Screen.dart';
import 'Dio4Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dio_test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Dio1Screen());
              },
              child: const Text('Button1'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Dio2Screen());
              },
              child: const Text('Button2'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Dio3Screen());
              },
              child: const Text('Button3'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Dio4Screen());
              },
              child: const Text('Button4'),
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