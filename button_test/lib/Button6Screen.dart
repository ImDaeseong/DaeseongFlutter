import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button6Screen extends StatelessWidget {
  const Button6Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Button6 Activity'),
      ),

      body: const Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            CustomButton6_1(),
            CustomButton6_2(),
          ],

        ),

      ),

    );

  }

  static void toast(BuildContext context, String sMsg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(sMsg),
      ),
    );
  }

}


class CustomButton6_1 extends StatelessWidget {
  const CustomButton6_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ElevatedButton(
        onPressed: () {
          Button6Screen.toast(context, "button1_Click");
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        child: const Text("button1"),
      ),
    );
  }

}

class CustomButton6_2 extends StatelessWidget {
  const CustomButton6_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: () {
          Button6Screen.toast(context, "button2_Click");
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 53)),
        ),
        child: const Text("button2"),
      ),
    );
  }

}