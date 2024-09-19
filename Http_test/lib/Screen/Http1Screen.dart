import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

class Http1Screen extends StatefulWidget {
  const Http1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Http1ScreenState();
  }
}

class Http1ScreenState extends State<Http1Screen> {

  // 스트림 구독
  late StreamSubscription<ConnectivityResult> connectStream;

  bool bConnected = false;

  final List<String> imageUrls = [
    "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png",
    "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png",
    "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png",
    "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png",
    "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png",
  ];

  @override
  void initState() {
    super.initState();

    // 스트림 구독 추가
    connectStream = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      checkConnectState(result);
    });
  }

  @override
  void dispose() {

    // 스트림 구독 취소
    connectStream.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http1Screen'),
      ),

      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.all(20),
            child: widgetImage(index),
          );

        },
      ),

    );
  }

  // 이미지 로드
  Widget widgetImage(int index) {
    return bConnected
        ? CachedNetworkImage(
      imageUrl: imageUrls[index],
      height: 100,
      width: 300,
      fit: BoxFit.fill,
      placeholder: (context, url) => const SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator()
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    )
        : Image.asset(
      'assets/images/r.png',
      height: 100,
      width: 300,
      fit: BoxFit.fill,
    );
  }

  // 네트워크 상태 변경 반영
  void checkConnectState(ConnectivityResult result) {
    setState(() {
      bConnected = result != ConnectivityResult.none;
    });
  }

}