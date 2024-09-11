import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button1Screen extends StatelessWidget {
  const Button1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Button1Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            button1Click(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white70,
            )
          ),
          child: const Text('Button1'),
        ),
      ),

    );
  }

  void button1Click(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('button1_Click')),
    );
  }

}