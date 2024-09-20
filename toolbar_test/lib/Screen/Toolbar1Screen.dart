import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toolbar1Screen extends StatelessWidget {
  const Toolbar1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('이용약관', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                '텍스트1\n텍스트2\n텍스트3\n텍스트4\n텍스트5\n텍스트6\n텍스트7\n텍스트8\n텍스트9\n텍스트10',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),

              SizedBox(height: 10),

              Text(
                '텍스트1\n텍스트2\n텍스트3\n텍스트4\n텍스트5\n텍스트6\n텍스트7\n텍스트8\n텍스트9\n텍스트10',
                style: TextStyle(fontSize: 16, color: Colors.cyan),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              Text(
                '텍스트1\n텍스트2\n텍스트3\n텍스트4\n텍스트5\n텍스트6\n텍스트7\n텍스트8\n텍스트9\n텍스트10',
                style: TextStyle(fontSize: 16,color: Colors.red),
                textAlign: TextAlign.end,
              ),

              SizedBox(height: 10),

              Text(
                '''
                텍스트1
                텍스트2
                텍스트3
                텍스트4
                텍스트5
                텍스트6
                텍스트7
                텍스트8
                텍스트9
                텍스트10
                ''',
                style: TextStyle(fontSize: 16,color: Colors.green),
              ),

              SizedBox(height: 20),

            ],
          ),

        ),

      ),

    );
  }

}