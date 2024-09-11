import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widget/CustomButtonEx.dart';
import '../Widget/CustomButtonExStyle.dart';

class Button5Screen extends StatelessWidget {
  const Button5Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Button5Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButtonEx(text: 'Button1',  onPressed: () => button5Click(context, 'button1_Click'), style: CustomButtonExStyle.style1),
            CustomButtonEx(text: 'Button2',  onPressed: () => button5Click(context, 'button2_Click'), style: CustomButtonExStyle.style2),
            CustomButtonEx(text: 'Button3',  onPressed: () => button5Click(context, 'button3_Click'), style: CustomButtonExStyle.style3),
            CustomButtonEx(text: 'Button4',  onPressed: () => button5Click(context, 'button4_Click'), style: CustomButtonExStyle.style4),
            CustomButtonEx(text: 'Button5',  onPressed: () => button5Click(context, 'button5_Click'), style: CustomButtonExStyle.style5),
          ],
        ),
      ),

    );
  }

  void button5Click(BuildContext context, String sMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(sMsg)),
    );
  }

}