import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'WebView1Screen.dart';
import 'WebView2Screen.dart';
import 'WebView3Screen.dart';
import 'WebView4Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('webview_test'),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const WebView1Screen());
              },
              child: const Text('Button1'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const WebView2Screen());
              },
              child: const Text('Button2'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const WebView3Screen());
              },
              child: const Text('Button3'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                navigateTo(context, const WebView4Screen());
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