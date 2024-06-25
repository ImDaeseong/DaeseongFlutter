import 'package:flutter/material.dart';

class Button4Screen extends StatelessWidget {
  const Button4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Button4 Activity'),
      ),

      body: Center(

        child: CustomButton4(

          onPressed: () {
            toast(context);
          },

          child: const Text(
            'Button1',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),

        ),

      ),

    );

  }

  void toast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('button1_Click'),
        duration: Duration(seconds: 2),
      ),
    );
  }

}

class CustomButton4 extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomButton4({super.key, required this.child, required this.onPressed});

  @override
  CustomButton4State createState() => CustomButton4State();
}

class CustomButton4State extends State<CustomButton4> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },

      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },

      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },

      onTap: widget.onPressed,

      child: Container(

        width: 150,
        height: 50,

        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),

          gradient: isPressed
              ? const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffc71a1a), Color(0xffffb9b9)],
          )
              : null,

          color: isPressed ? null : const Color(0xffffb9b9),

          border: Border.all(width: 2, color: const Color(0xff4b4c4c)),

        ),

        child: Center(
          child: widget.child,
        ),

      ),

    );

  }

}
