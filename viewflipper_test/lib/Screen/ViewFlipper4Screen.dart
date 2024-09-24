import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewFlipper4Screen extends StatefulWidget {
  const ViewFlipper4Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewFlipper4ScreenState();
  }
}

class ViewFlipper4ScreenState extends State<ViewFlipper4Screen> {

  late PageController pageController;

  int nCurrentIndex = 0;
  double dlastX = 0;
  double dcurrentX = 0;

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
    if (nCurrentIndex < 2) {
      setState(() {
        nCurrentIndex++;
        pageController.animateToPage(
          nCurrentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void showPrevious() {
    if (nCurrentIndex > 0) {
      setState(() {
        nCurrentIndex--;
        pageController.animateToPage(
          nCurrentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewFlipper4Screen'),
      ),
      body: GestureDetector(
        onPanStart: (details) {
          dlastX = details.globalPosition.dx;
        },

        onPanEnd: (details) {
          dcurrentX = details.velocity.pixelsPerSecond.dx;

          if (dlastX < dcurrentX) {
            showPrevious();
          } else if (dlastX > dcurrentX) {
            showNext();
          }
        },

        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              nCurrentIndex = index;
            });
          },
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

      )
    );
  }

}