import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomToolbar1 extends StatelessWidget {
  const CustomToolbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Text(
              '이용약관',
              style: TextStyle(color: Colors.white, fontSize: 20, ),
            ),

            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
    );
  }
}