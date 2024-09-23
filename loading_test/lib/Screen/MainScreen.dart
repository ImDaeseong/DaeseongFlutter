import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Loading1Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('loading_test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            navigateTo(context, const Loading1Screen());
          },
          child: const Text('Button1'),
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