import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Dio4Screen extends StatefulWidget {
  const Dio4Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Dio4ScreenState();
  }
}

class Dio4ScreenState extends State<Dio4Screen> {

  final Dio dio = Dio();
  String tv1Text = "";
  String tv2Text = "";

  // 호출 정보
  final String sPage = "http://www.worldjob.or.kr/openapi/openapi.do?";
  final String sdobType = "1"; // 1: 해외취업
  final String sdsptcKsco = "01"; // 직종별코드
  final String scontinent = "1"; // 대륙별코드
  final String sepmt61 = "Y"; // 일자리Best20
  final String sshowItemListCount = "1000"; // 리스트 갯수

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Dio4Screen'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    tv1Text,
                    style: const TextStyle(fontSize: 16),
                    maxLines: null, // 무한 스크롤 가능
                  ),
                ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {

                  getRequestData();

                },
                child: const Text('GET 요청'),
            ),

            Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    tv2Text,
                    style: TextStyle(fontSize: 16),
                    maxLines: null, // 무한 스크롤 가능
                  ),
                ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {

                  postRequestData();

                },
                child: const Text('POST 요청'),
            ),

          ],
        ),
      ),

    );
  }

  Future<void> getRequestData() async {
    setState(() {
      tv1Text = ""; // 초기화
    });

    final String sUrl = "$sPage&dobType=$sdobType&dsptcKsco=$sdsptcKsco&continent=$scontinent&showItemListCount=$sshowItemListCount&sepmt61=$sepmt61";

    try {
      final response = await dio.get(sUrl);
      setState(() {
        tv1Text = response.data.toString(); // JSON 응답
      });
    } catch (error) {
      print("getData onErrorResponse: $error");
    }
  }

  Future<void> postRequestData() async {
    setState(() {
      tv2Text = ""; // 초기화
    });

    final String sUrl = sPage;

    try {
      final response = await dio.post(sUrl, data: {
        "dobType": sdobType,
        "dsptcKsco": sdsptcKsco,
        "continent": scontinent,
        "showItemListCount": sshowItemListCount,
        "sepmt61": sepmt61,
      });
      setState(() {
        tv2Text = response.data.toString(); // JSON 응답
      });
    } catch (error) {
      print("getPostData onErrorResponse: $error");
    }
  }

}