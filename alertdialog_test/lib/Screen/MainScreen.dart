import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widget/CustomDialog.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog Test'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
                onPressed: () {
                  showAlertDialog1(context);
                },
                child: const Text('Button1'),
            ),

            ElevatedButton(
              onPressed: () {
                showAlertDialog2(context);
              },
              child: const Text('Button2'),
            ),

            ElevatedButton(
              onPressed: () {
                showAlertDialog3(context);
              },
              child: const Text('Button3'),
            ),

          ],
        ),
      ),
    );
  }
}