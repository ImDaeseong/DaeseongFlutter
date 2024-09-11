import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required  this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        child: Text(text),
    );
  }
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
  );
}