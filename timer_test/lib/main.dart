import 'package:flutter/material.dart';
import 'Screen/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timer_test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const MainScreen(),
    );
  }
}

