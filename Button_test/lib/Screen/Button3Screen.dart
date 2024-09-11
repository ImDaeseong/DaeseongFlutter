import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button3Screen extends StatelessWidget {
  const Button3Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Button3Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            button3Click(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white70,
          ),
          child: const Text('Button3'),
        ),
      ),

    );
  }

  void button3Click(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('button3_Click')),
    );
  }
}