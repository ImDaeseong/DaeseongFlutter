import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Splash1Activity.dart';
import 'Splash2Activity.dart';
import 'Splash3Activity.dart';
import 'Splash4Activity.dart';
import 'Splash5Activity.dart';
import 'Splash6Activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // 상태 바 숨기기
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Splash1Activity(),
      //home: Splash2Activity(),
      //home: Splash3Activity(),
      //home: Splash4Activity(),
      //home: Splash5Activity(),
      home: Splash6Activity(),
    );
  }
}
