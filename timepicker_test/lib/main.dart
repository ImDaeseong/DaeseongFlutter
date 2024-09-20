import 'package:flutter/material.dart';
import 'Screen/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'timepicker_test',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
