import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewFlipper1Screen extends StatefulWidget {
  const ViewFlipper1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewFlipper1ScreenState();
  }
}

class ViewFlipper1ScreenState extends State<ViewFlipper1Screen> {

  late PageController pageController;

  int nCurrentIndex = 0;
  bool bIsFlipping = false;

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
    bIsFlipping = true;
    
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 2));

      if (bIsFlipping) {
        setState(() {
          //3개 이미지 반복
          nCurrentIndex = (nCurrentIndex + 1) % 3;
          pageController.animateToPage(nCurrentIndex, duration: const Duration(microseconds: 500), curve: Curves.easeInOut);
        });
      }
      return bIsFlipping;
    });

  }

  void stopFlipping() {
    
    setState(() {
      bIsFlipping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewFlipper1Screen'),
      ),
      body: Column(
        children: [

          Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  nCurrentIndex = index;
                },
                children: [
                  Image.asset('assets/images/intro1.png'),
                  Image.asset('assets/images/intro2.png'),
                  Image.asset('assets/images/intro3.png'),
                ],
              ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                  onPressed: () {
                    startFlipping();
                  },
                  child: const Text('startFlipping')),

              const SizedBox(width: 10),

              ElevatedButton(
                  onPressed: () {
                    stopFlipping();
                  },
                  child: const Text('stopFlipping')),
            ],
          ),

        ],

      ),

    );
  }

}