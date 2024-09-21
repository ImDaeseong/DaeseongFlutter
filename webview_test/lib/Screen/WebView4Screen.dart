import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'ErrorScreen.dart';

class WebView4Screen extends StatefulWidget {
  const WebView4Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebView4ScreenState();
  }
}

class WebView4ScreenState extends State<WebView4Screen> {

  late WebViewController webViewController;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(

          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },

          onPageFinished: (String url) async {
            setState(() {
              isLoading = false;
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
        title: const Text('WebView4Screen', style: TextStyle(color: Colors.white, fontSize: 20)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              webViewController.reload();
            },
          ),
        ],
      ),

      body: Stack(
        children: [

          WebViewWidget(controller: webViewController),

          if (isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),

    );
  }

}