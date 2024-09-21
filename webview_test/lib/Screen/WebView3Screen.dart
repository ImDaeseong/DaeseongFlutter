import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'ErrorScreen.dart';

class WebView3Screen extends StatefulWidget {
  const WebView3Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebView3ScreenState();
  }
}

class WebView3ScreenState extends State<WebView3Screen> {

  late WebViewController webViewController;

  String sTitle = '';
  int nBackPressCounter = 0;
  DateTime? tlastBackPressTime;

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
              sTitle = url;
            });
          },

          onWebResourceError: (WebResourceError error) {

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ErrorScreen(
                      sUrl: error.url ?? 'error.url',
                      nErrorCode: error.errorCode,
                      sDescription: error.description ?? 'error.description',
                    ),
                ),
            );
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
      ..loadRequest(Uri.parse('https://m.naver.com'));
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
        title: Text(sTitle.isNotEmpty ? sTitle : 'WebView3Screen', style: const TextStyle(color: Colors.white, fontSize: 20)),
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

  Future<bool> onWillPop() async {
    if ( await webViewController.canGoBack() ) {
      webViewController.goBack();
      return false;
    } else {
      return handleBackPress();
    }
  }

  Future<bool> handleBackPress() async {
    final now = DateTime.now();
    if ( tlastBackPressTime == null || now.difference(tlastBackPressTime!) > const Duration(seconds: 2)) {

      tlastBackPressTime = now;
      nBackPressCounter = 1;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('다시 백버튼 클릭시 종료')),
      );

      return false;

    } else if (nBackPressCounter == 1) {

      return true;
    }

    return false;
  }

}