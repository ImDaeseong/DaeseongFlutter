import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView1Screen extends StatefulWidget {
  const WebView1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebView1ScreenState();
  }
}

class WebView1ScreenState extends State<WebView1Screen> {

  late WebViewController webViewController;

  String sTitle = '';
  String currentFile = 'test1.html';

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(

          onPageStarted: (String url) {
            debugPrint('onPageStarted: $url');
          },

          onPageFinished: (String url) async {
            sTitle = await webViewController.getTitle() ?? '';
            setState(() {
            });
          },

          onNavigationRequest: (NavigationRequest request) {

            if (request.url.startsWith('app://')) {
              Navigator.pushReplacementNamed(context, '/main');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },

        ),
      )
      ..loadFlutterAsset('assets/$currentFile');
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
        title: Text(sTitle.isNotEmpty ? sTitle : 'WebView1Screen', style: const TextStyle(color: Colors.white, fontSize: 20)),
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