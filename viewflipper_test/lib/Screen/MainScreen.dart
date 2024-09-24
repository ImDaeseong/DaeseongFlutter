import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ViewFlipper1Screen.dart';
import 'ViewFlipper2Screen.dart';
import 'ViewFlipper3Screen.dart';
import 'ViewFlipper4Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('viewflipper_test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const ViewFlipper1Screen());
              },
              child: const Text('Button1'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const ViewFlipper2Screen());
              },
              child: const Text('Button2'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const ViewFlipper3Screen());
              },
              child: const Text('Button3'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const ViewFlipper4Screen());
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