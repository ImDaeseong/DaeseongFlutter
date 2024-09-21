import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView2Screen extends StatefulWidget {
  const WebView2Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebView2ScreenState();
  }
}

class WebView2ScreenState extends State<WebView2Screen> {

  late WebViewController webViewController;

  String sTitle = '';
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

            sTitle = await webViewController.getTitle() ?? '';
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
      ..addJavaScriptChannel(
        'Android',
        onMessageReceived: (JavaScriptMessage message) {

          if (message.message == 'finish') {
            Navigator.of(context).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          }
        },
      )
      ..loadFlutterAsset('assets/test2.html');
  }

  @override
  void dispose() {
    webViewController.clearCache();
    webViewController.clearLocalStorage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if(didPop) return;

        if (await webViewController.canGoBack()) {
          webViewController.goBack();
        } else {
          Navigator.pop(context);//Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF66BD61),
          title: Text(sTitle.isNotEmpty ? sTitle : 'WebView2Screen', style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: webViewController),

            if (isLoading)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),

    );
  }
}