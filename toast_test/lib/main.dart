import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'toast_test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  GlobalKey globalKey = GlobalKey();
  Uint8List? capturedPng;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('toast_test'),
      ),
      body: Center(

        child: RepaintBoundary(
          key: globalKey,
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                  ElevatedButton(
                    onPressed: () {
                      showToast(context, "button1_Click");
                      },
                    child: const Text('button1'),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: () {
                      showSnackBar(context, "button2_Click");
                      },
                    child: const Text('button2'),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context, "button3_Click");
                      },
                    child: const Text('button3'),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: () {
                      showCustomSnackBar(context, "button4_Click");
                      },
                    child: const Text('button4'),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: () {
                      captureWidget();
                      },
                    child: const Text('button5'),
                  ),

                  const SizedBox(height: 16),

                  if (capturedPng != null)
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                          image: MemoryImage(capturedPng!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

              ],
            );
          },
        ),

        ),

      ),

    );

  }


  Future<void> captureWidget() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100)); // Add a small delay
      RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List captured = byteData!.buffer.asUint8List();
      setState(() {
        capturedPng = captured;
      });
    } catch (e) {
      print('Error capturing widget: $e');
    }
  }

  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message, style: const TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }

}
