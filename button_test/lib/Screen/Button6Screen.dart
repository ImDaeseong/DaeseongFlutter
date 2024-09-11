import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button6Screen extends StatelessWidget {
  const Button6Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Button6Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => button6Click(context, 'button1_Click'), child: const Text('Button1')),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => button6Click(context, 'button2_Click'), child: const Text('Button2')),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(onPressed: () => button6Click(context, 'button3_Click'), child: const Text('Button3')),
            const SizedBox(height: 16.0),
            ElevatedButton(onPressed: () => button6Click(context, 'button4_Click'), child: const Text('Button4')),
          ],
        ),
      ),

    );
  }

  void button6Click(BuildContext context, String sMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(sMsg),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}