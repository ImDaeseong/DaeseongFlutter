import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button2Screen extends StatelessWidget {
  const Button2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Button2 Activity'),
      ),

      body: const Center(

        child: CustomButton2(),

      ),

    );

  }

}


class CustomButton2 extends StatefulWidget {
  const CustomButton2({super.key});

  @override
  MyCustomButton2State createState() => MyCustomButton2State();
}

class MyCustomButton2State extends State<CustomButton2> {

  bool bPressed = false;

  void toast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('button1_Click'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTapDown: (_) => setState(() {
        bPressed = true;
      }),

      onTapUp: (_) => setState(() {
        bPressed = false;
      }),

      onTapCancel: () => setState(() {
        bPressed = false;
      }),

      onTap: () => toast(context),

      child: Image.asset(
          bPressed ? 'assets/images/btn_press.png' : 'assets/images/btn_focus.png'
      ),


    );

  }

}
