import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewFlipper2Screen extends StatefulWidget {
  const ViewFlipper2Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewFlipper2ScreenState();
  }
}

class ViewFlipper2ScreenState extends State<ViewFlipper2Screen> {

  late PageController pageController;

  int nCurrentIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void showNext() {
    setState(() {
      //3개 text 반복
      nCurrentIndex = (nCurrentIndex + 1) % 3;
      pageController.animateToPage(
          nCurrentIndex,
          duration: const Duration(microseconds: 300),
          curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewFlipper2Screen'),
      ),
      body: Column(
        children: [

          Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  nCurrentIndex = index;
                },
                children: const [

                  Center(
                    child: Text(
                      'textview1',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Center(
                    child: Text(
                      'textview2',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Center(
                    child: Text(
                      'textview3',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
          ),

          ElevatedButton(
              onPressed: () {
                showNext();
              },
              child: const Text('showNext'),
          ),

        ],
      ),

    );
  }

}