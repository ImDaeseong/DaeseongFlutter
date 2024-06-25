import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button3Screen extends StatelessWidget {
  const Button3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Button3 Activity'),
      ),

      body: Center(
        child: CustomButton3(
          text: 'Button1',
          onPressed: () {
            print('button1_Click');
          },
        ),
      ),

    );

  }
}

class CustomButton3 extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton3({super.key, required this.text, required this.onPressed});

  @override
  CustomButton3State createState() => CustomButton3State();
}

class CustomButton3State extends State<CustomButton3> {
  bool bFocused = false;
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
    return Center(

      child: Focus(

        onFocusChange: (bFocused) {
          setState(() {
            this.bFocused = bFocused;
          });
        },

        child: GestureDetector(

          onTapDown: (_) => setState(() {
            bPressed = true;
          }),

          onTapUp: (_) => setState(() {
            bPressed = false;
          }),

          onTapCancel: () => setState(() {
            bPressed = false;
          }),

          onTap: () {
            widget.onPressed?.call();
            toast(context);
          },

          child: Center(

            child: Stack(

              alignment: Alignment.center,

              children: [

                Image.asset(
                  bPressed ? 'assets/images/btn_press.png'
                      : bFocused ? 'assets/images/btn_focus.png' : 'assets/images/button_no.png',
                  fit: BoxFit.cover,
                ),

                Center(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],

            ),

          ),

        ),

      ),

    );

  }
}
