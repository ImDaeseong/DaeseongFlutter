import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button1Screen extends StatelessWidget {
  const Button1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Button1 Activity'),
      ),

      body: Center(

        child: CustomButton1(

          text: 'Button1',

          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('button1_Click')),
            );
          },

        ),

      ),

    );

  }

}



class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton1({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: onPressed,

      child: Ink (

        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Container(

          width: 150,

          height: 50,

          constraints: const BoxConstraints(minWidth: 150, minHeight: 50),

          alignment: Alignment.center,

          child: Text(text, style: const TextStyle(color: Colors.white),

          ),

        ),

      ),

    );

  }

}
