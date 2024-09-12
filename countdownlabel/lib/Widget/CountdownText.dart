import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountdownText extends StatelessWidget {

  final int nSeconds;
  final bool isBlinking;

  const CountdownText({
    super.key,
    required this.nSeconds,
    required this.isBlinking,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '현재 페이지 $nSeconds초',
      style: TextStyle(
        color: Colors.orange,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontStyle: isBlinking ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}