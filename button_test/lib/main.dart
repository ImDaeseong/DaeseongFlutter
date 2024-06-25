import 'package:flutter/material.dart';

import 'Button1Screen.dart';
import 'Button2Screen.dart';
import 'Button3Screen.dart';
import 'Button4Screen.dart';
import 'Button5Screen.dart';
import 'Button6Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp Button Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Scaffold Button Test'),
      ),

      body: const Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            CustomButton('Button 1', Button1Screen()),
            SizedBox(height: 50),

            CustomButton('Button 2', Button2Screen()),
            SizedBox(height: 50),

            CustomButton('Button 3', Button3Screen()),
            SizedBox(height: 50),

            CustomButton('Button 4', Button4Screen()),
            SizedBox(height: 50),

            CustomButton('Button 5', Button5Screen()),
            SizedBox(height: 50),

            CustomButton('Button 6', Button6Screen()),
          ],

        ),

      ),

    );

  }

}

class CustomButton extends StatelessWidget {

  final String text;
  final Widget screen;

  const CustomButton(this.text, this.screen, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        style: ButtonStyle(        
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),      
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },

        child: Text(text),

    );

  }

}