import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonEx extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final ButtonStyle style;

  const CustomButtonEx({
    super.key,
    required this.text,
    required this.onPressed,
    required this.style,
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(text),
    );
  }
}