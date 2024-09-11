import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widget/CustomButton.dart';
import 'Button1Screen.dart';
import 'Button2Screen.dart';
import 'Button3Screen.dart';
import 'Button4Screen.dart';
import 'Button5Screen.dart';
import 'Button6Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('appBar'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(text: 'Button 1', onPressed: () => navigateTo(context, const Button1Screen())),
            const SizedBox(height: 50),

            CustomButton(text: 'Button 2', onPressed: () => navigateTo(context, const Button2Screen())),
            const SizedBox(height: 50),

            CustomButton(text: 'Button 3', onPressed: () => navigateTo(context, const Button3Screen())),
            const SizedBox(height: 50),

            CustomButton(text: 'Button 4', onPressed: () => navigateTo(context, const Button4Screen())),
            const SizedBox(height: 50),

            CustomButton(text: 'Button 5', onPressed: () => navigateTo(context, const Button5Screen())),
            const SizedBox(height: 50),

            CustomButton(text: 'Button 6', onPressed: () => navigateTo(context, const Button6Screen())),
            const SizedBox(height: 50),

          ],
        ),

      ),

    );
  }

}