import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button2Screen extends StatelessWidget {
  const Button2Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Button2Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            button2Click(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white70,
            )
          ),
          child: const Text('Button2'),
        ),
      ),

    );
  }

  void button2Click(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('button2_Click')),
    );
  }
}