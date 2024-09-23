import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Dio1Screen extends StatefulWidget {
  const Dio1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Dio1ScreenState();
  }
}

class Dio1ScreenState extends State<Dio1Screen> {

  final String sPage = "http://www.worldjob.or.kr/openapi/openapi.do?";
  final String sdobType = "1";
  final String sdsptcKsco = "01";
  final String scontinent = "1";
  final String sepmt61 = "Y";
  final String sshowItemListCount = "1000";

  String getResponse = '';
  String postResponse = '';

  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio1Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            ElevatedButton(
                onPressed: () {

                  // GET 요청
                  getData();

                  // POST 요청
                  postData();

                },
                child: const Text('Request Data'),
            ),

            Expanded(
                child: SingleChildScrollView(
                  child: Text(getResponse, style: const TextStyle(height: 1.5)),
                ),
            ),

            const SizedBox(height: 20),

            Expanded(
                child: SingleChildScrollView(
                  child: Text(postResponse, style: const TextStyle(height: 1.5)),
                ),
            ),

          ],
        ),
      ),

    );
  }

  Future<void> getData() async {

    final url = '$sPage&dobType=$sdobType&dsptcKsco=$sdsptcKsco&continent=$scontinent&showItemListCount=$sshowItemListCount&sepmt61=$sepmt61';
    try {
      final response = await dio.get(url);
      setState(() {
        getResponse = response.data.toString();
      });
    } catch (e) {
      setState(() {
        getResponse = 'Error: $e';
      });
    }
  }

  Future<void> postData() async {
    final url = sPage;
    try {
      final response = await dio.post(
        url,
        data: {
          'dobType': sdobType,
          'dsptcKsco': sdsptcKsco,
          'continent': scontinent,
          'showItemListCount': sshowItemListCount,
          'sepmt61': sepmt61,
        },
      );
      setState(() {
        postResponse = response.data.toString();
      });
    } catch (e) {
      setState(() {
        postResponse = 'Error: $e';
      });
    }
  }

}