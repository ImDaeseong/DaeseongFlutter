import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button5Screen extends StatelessWidget {
  const Button5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Button5 Activity'),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            CustomButton5(
              text: 'Button1',
              margin: const EdgeInsets.only(top: 52.0),
              onPressed: () => toast(context, 'button1_Click'), // 콜백 함수 직접 호출
            ),

            CustomButton5(
              text: 'Button2',
              margin: const EdgeInsets.only(top: 52.0),
              onPressed: () => toast(context, 'button2_Click'), // 콜백 함수 직접 호출
            ),

            CustomButton5(
              text: 'Button3',
              margin: const EdgeInsets.only(top: 52.0),
              onPressed: () => toast(context, 'button3_Click'), // 콜백 함수 직접 호출
            ),

            CustomButton5(
              text: 'Button4',
              margin: const EdgeInsets.only(top: 52.0),
              onPressed: () => toast(context, 'button4_Click'), // 콜백 함수 직접 호출
            ),

            CustomButton5(
              text: 'Button5',
              margin: const EdgeInsets.only(top: 52.0),
              onPressed: () => toast(context, 'button5_Click'), // 콜백 함수 직접 호출
            ),

          ],

        ),

      ),

    );
  }

  void toast(BuildContext context, String sMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(sMsg),
        duration: const Duration(seconds: 2),
      ),
    );
  }

}


class CustomButton5 extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets margin;

  const CustomButton5({super.key,
    required this.text,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: margin,

      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          textStyle: const TextStyle(fontSize: 18.0),
        ),

        child: Text(text),

      ),

    );

  }

}
