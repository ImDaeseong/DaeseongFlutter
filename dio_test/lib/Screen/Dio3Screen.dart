import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Dio3Screen extends StatefulWidget {
  const Dio3Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Dio3ScreenState();
  }
}

class Dio3ScreenState extends State<Dio3Screen> {

  final Dio dio = Dio();
  String tv1Text = "";
  String tv2Text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Dio3Screen'),
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

            Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    tv2Text,
                    style: const TextStyle(fontSize: 16),
                    maxLines: null, // 무한 스크롤 가능
                  ),
                ),
            ),

            ElevatedButton(
                onPressed: () {
                  requestGetJson();
                },
                child: const Text('Get JSON'),
            ),

          ],
        ),
      ),

    );
  }

  Future<void> requestGetJson() async {

    const String url = "https://api.bithumb.com/public/ticker/BTC";

    try {
      final response = await dio.get(url);
      setState(() {
        tv1Text = response.toString(); // 전체 JSON 응답
      });

      if (response.data['status'] == "0000") {
        final data = response.data['data'];
        final String openingPrice = data['opening_price'];
        final String closingPrice = data['closing_price'];
        final String minPrice = data['min_price'];
        final String maxPrice = data['max_price'];
        final String unitsTraded = data['units_traded'];
        final String accTradeValue = data['acc_trade_value'];
        final String prevClosingPrice = data['prev_closing_price'];
        final String unitsTraded24H = data['units_traded_24H'];
        final String accTradeValue24H = data['acc_trade_value_24H'];
        final String fluctuate24H = data['fluctate_24H'];
        final String fluctuateRate24H = data['fluctate_rate_24H'];
        final String date = data['date'];

        tv2Text = "$openingPrice\n$closingPrice\n$minPrice\n$maxPrice\n"
            "$unitsTraded\n$accTradeValue\n$prevClosingPrice\n"
            "$unitsTraded24H\n$accTradeValue24H\n$fluctuate24H\n"
            "$fluctuateRate24H\n$date";
      }
    } catch (e) {
      print("requestGetJson error: $e");
    }
  }

}