import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Http3Screen extends StatefulWidget {
  const Http3Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Http3ScreenState();
  }
}

class Http3ScreenState extends State<Http3Screen> {

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
        title: const Text('Http3Screen'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),
        child : Column(
          children: [

            SingleChildScrollView(
              child: Center(
                child: Text(
                  sResult,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: loadData,
              child: const Text('새로고침'),
            ),

          ],
        ),

      ),

    );
  }

  Future<void> loadData() async {
    const sUrl = 'https://api.bithumb.com/public/ticker/BTC';

    try {

      final response = await http.get(Uri.parse(sUrl)).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {

        setState(() {
          sResult = response.body;
        });

      } else {

        setState(() {
          sResult = 'Error: ${response.statusCode}';
        });

      }
    } catch(ex) {

      setState(() {
        sResult = 'Error: ${ex.toString()}';
      });

    }

  }

}