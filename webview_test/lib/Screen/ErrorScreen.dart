import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {

  final String sUrl;
  final int nErrorCode;
  final String sDescription;

  const ErrorScreen({
    super.key,
    required this.sUrl,
    required this.nErrorCode,
    required this.sDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('ErrorScreen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error URL: $sUrl'),
            Text('Error Code: $nErrorCode'),
            Text('Description: $sDescription'),
          ],
        ),
      ),

    );
  }

}