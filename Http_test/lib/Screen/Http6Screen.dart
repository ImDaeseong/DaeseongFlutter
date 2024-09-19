import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class Http6Screen extends StatefulWidget {
  const Http6Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Http6ScreenState();
  }
}

class Http6ScreenState extends State<Http6Screen> {

  String sResult = '';

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http6Screen'),
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


  Future<bool> isConnect() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }


  Future<void> loadData() async {

    const sUrl = 'https://api.bithumb.com/public/ticker/BTC';

    bool bConnect = await isConnect();
    if(!bConnect) {
      setState(() {
        sResult = "미접속";
      });
      return;
    }

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