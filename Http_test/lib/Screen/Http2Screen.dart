import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class Http2Screen extends StatefulWidget {
  const Http2Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Http2ScreenState();
  }
}

class Http2ScreenState extends State<Http2Screen> {

  //바이트 데이터
  Uint8List? byteImage;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http2Screen'),
      ),

      body: Center(
        child: byteImage == null ? Image.asset('assets/images/r.png') : Image.memory(byteImage!),
      ),

    );
  }

  Future<void> loadData() async {
    const sUrl = 'https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png';

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
      print('Error: $ex');
    }
  }

}