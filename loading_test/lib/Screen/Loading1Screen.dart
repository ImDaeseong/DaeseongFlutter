import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../Widget/LoadingDialog1.dart';

class Loading1Screen extends StatefulWidget {
  const Loading1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Loading1ScreenState();
  }
}

class Loading1ScreenState extends State<Loading1Screen> with SingleTickerProviderStateMixin {

  bool bIsLoading = false;
  Timer? timer;
  int nTimeCount = 0;
  
  late LoadingDialog1 loadingDialog1;

  void closeTimer() {
    timer?.cancel();
    timer = null;
  }

  void startTimer() {
    closeTimer();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {

      setState(() {
        nTimeCount++;
      });

      if (nTimeCount > 5) {
        closeTimer();
        hideLoading();
      }

    });
  }

  void shodwLoading() {

    if (!loadingDialog1.isShowing()) {
      loadingDialog1.show();
      bIsLoading = true;
    }

  }

  void hideLoading() {

    if (loadingDialog1.isShowing()) {
      loadingDialog1.dismiss();
      bIsLoading = false;
    }

  }


  @override
  void initState() {
    super.initState();

    loadingDialog1 = LoadingDialog1(context, this);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      shodwLoading();
      startTimer();
    });
  }

  @override
  void dispose() {

    closeTimer();
    loadingDialog1.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading1Screen'),
      ),
      body: const Center(
        child: Text('shodwLoading'),
      ),
    );
  }

}