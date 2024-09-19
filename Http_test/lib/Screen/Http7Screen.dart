import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Http7Screen extends StatefulWidget {
  const Http7Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Http7ScreenState();
  }
}

class Http7ScreenState extends State<Http7Screen> {

  String sResult = '';

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http7Screen'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Text(
            sResult,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
        ),

      ),

    );
  }

  Future<void> loadData() async {
    const sUrl = 'https://api.bithumb.com/public/ticker/BTC';

    try {

      final result = await getUrlData(sUrl);

      setState(() {
        sResult = result;
      });

    } catch (e) {

      setState(() {
        sResult = "Error: ${e.toString()}";
      });

    }

  }

  Future<String> getUrlData(String sUrl) async {

    try {

      final response = await http.get(Uri.parse(sUrl)).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: ${e.toString()}";
    }

  }


}