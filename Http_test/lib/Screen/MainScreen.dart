import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Http1Screen.dart';
import 'Http2Screen.dart';
import 'Http3Screen.dart';
import 'Http4Screen.dart';
import 'Http5Screen.dart';
import 'Http6Screen.dart';
import 'Http7Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http_test'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Http1Screen());
              },
              child: const Text('Button1'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Http2Screen());
              },
              child: const Text('Button2'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Http3Screen());
              },
              child: const Text('Button3'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Http4Screen());
              },
              child: const Text('Button4'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Http5Screen());
              },
              child: const Text('Button5'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Http6Screen());
              },
              child: const Text('Button6'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const Http7Screen());
              },
              child: const Text('Button7'),
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