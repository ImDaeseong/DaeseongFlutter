import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CachedImage1Screen.dart';
import 'CachedImage2Screen.dart';
import 'CachedImage3Screen.dart';
import 'CachedImage4Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cashed_network_image_test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const CachedImage1Screen());
              },
              child: const Text('Button1'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const CachedImage2Screen());
              },
              child: const Text('Button2'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const CachedImage3Screen());
              },
              child: const Text('Button3'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const CachedImage4Screen());
              },
              child: const Text('Button4'),
            ),

          ],
        ),

      ),

    );
  }

  void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}