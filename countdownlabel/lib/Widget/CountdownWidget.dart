import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountdownWidget  extends StatelessWidget {

  final int nCount;
  final double dOpacity;
  final VoidCallback onStart;
  final VoidCallback onStop;

  const CountdownWidget({
    super.key,
    required this.nCount,
    required this.dOpacity,
    required this.onStart,
    required this.onStop
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: dOpacity,
          child: Text(
            '현재 페이지 ${nCount.toString().padLeft(2, '0')} 초',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.orange,
            ),
          ),
        ),

        const SizedBox(height: 50),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onStart,
              child: const Text('시작'),
            ),

            const SizedBox(width: 20),

            ElevatedButton(
              onPressed: onStop,
              child: const Text('종료'),
            ),

          ],
        ),

      ],
    );
  }
}