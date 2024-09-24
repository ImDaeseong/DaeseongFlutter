import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewFlipper3Screen extends StatefulWidget {
  const ViewFlipper3Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewFlipper3ScreenState();
  }
}

class ViewFlipper3ScreenState extends State<ViewFlipper3Screen> {

  late PageController pageController;

  int nCurrentIndex = 0;
  bool bIsFading = true;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 0);
    startFlipping();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void startFlipping() {

    Future.doWhile(() async {

      await Future.delayed(const Duration(seconds: 5));
      if (mounted) {
        setState(() {
          bIsFading = false;
        });
      }

      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        nCurrentIndex = (nCurrentIndex + 1) % 3;
        bIsFading = true;
      });

      await pageController.animateToPage(
        nCurrentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewFlipper3Screen'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: bIsFading ? 1.0 : 0.0,
          duration: const Duration(microseconds: 500),
          child: PageView(
            controller: pageController,
            children: [

              Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Page 1',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),

              Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Page 2',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),

              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Page 3',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}