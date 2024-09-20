import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Toolbar4Screen extends StatefulWidget {
  const Toolbar4Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Toolbar4ScreenState();
  }
}

class Toolbar4ScreenState extends State<Toolbar4Screen> {

  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.youtube.com'));
  }

  @override
  void dispose() {

    webViewController.clearCache();
    webViewController.clearLocalStorage();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xFF66BD61),

        title: const Text('이용약관', style: TextStyle(color: Colors.white, fontSize: 20),  ),

        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],

      ),

      body: WebViewWidget(
        controller: webViewController,
      ),

    );
  }

}