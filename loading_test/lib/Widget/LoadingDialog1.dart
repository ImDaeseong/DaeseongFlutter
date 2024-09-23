import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog1 {

  BuildContext context;
  bool bIsShowing = false;
  late AnimationController animationController;
  late Animation<double> animation;

  LoadingDialog1(this.context, TickerProvider vsync) {

    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    animation = Tween<double>(begin: 1.0, end: 1.5).animate(animationController);
  }

  void show() {

    if (!bIsShowing) {
      bIsShowing = true;

      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Material(
              type: MaterialType.transparency,
              child: widgetLoadingContent(),
            ),
          );
        },

      );

    }

  }

  void dismiss() {

    if (bIsShowing) {
      Navigator.of(context).pop();
      bIsShowing = false;
      animationController.stop();
    }

  }

  bool isShowing() {
    return bIsShowing;
  }

  Widget widgetLoadingContent() {
    return Center(

      child: Container(
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.scale(
                scale: animation.value,
                child: Image.asset('assets/images/wait.png'),
              );
            },
          ),
        ),

      ),

    );

  }

  void dispose() {
    animationController.dispose();
  }
}