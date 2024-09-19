import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class Http5Screen extends StatefulWidget {
  const Http5Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Http5ScreenState();
  }
}

class Http5ScreenState extends State<Http5Screen> {

  //바이트 데이터
  Uint8List? byteImage;

  String sResult = '';

  bool bLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http5Screen'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widgetLoadingIndicator(),
            widgetImageView(),
            widgetTextView(),
            widgetButton(),
          ],
        ),

      ),

    );
  }

  Widget widgetLoadingIndicator() {
    return bLoading ?
    const Center(child: SpinKitCircle( color: Colors.blue, size: 50.0, ), )
        : const SizedBox.shrink();
  }

  Widget widgetImageView() {
    return byteImage != null ?
    Image.memory(byteImage!)
        : const SizedBox.shrink();
  }

  Widget widgetTextView() {
    return !bLoading && sResult.isNotEmpty ?
        Expanded(
            child: SingleChildScrollView(
              child: Text(sResult),
            ),
        )
        : const SizedBox.shrink();
  }

  Widget widgetButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: downloadImage,
            child: const Text('Image'),
        ),

        ElevatedButton(
          onPressed: downloadJson,
          child: const Text('json'),
        ),

      ],
    );

  }


  Future<void> downloadImage() async {

    const sUrl = 'https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png';

    setState(() {
      bLoading = true;
    });

    try {

      final response = await http.get(Uri.parse(sUrl)).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {

        setState(() {
          byteImage = response.bodyBytes;
        });

      } else {

        print('Error: ${response.statusCode}');

      }

    } catch(ex) {

      print('Error: ${ex.toString()}');

    } finally {
      bLoading = false;
    }
  }

  Future<void> downloadJson() async {

    const sUrl = 'https://api.bithumb.com/public/ticker/BTC';

    setState(() {
      bLoading = true;
    });

    try {

      final response = await http.get(Uri.parse(sUrl)).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {

        setState(() {
          sResult = response.body;
        });

      } else {

        print('Error: ${response.statusCode}');

      }
    } catch(ex) {

      print('Error: $ex');

    } finally {

      setState(() {
        bLoading = false;
      });

    }

  }

}