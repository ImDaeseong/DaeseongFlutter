import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button4Screen extends StatelessWidget {
  const Button4Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Button4Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            button4Click(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white70,
          ),
          child: const Text('Button4'),
        ),

      ),

    );
  }

  void button4Click(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('button4_Click')),
    );
  }
}