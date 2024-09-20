import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbar_test/Widget/CustomToolbar1.dart';

class Toolbar2Screen extends StatelessWidget {
  const Toolbar2Screen({super.key});

  @override
  Widget build(BuildContext context) {

    //상태바 숨김
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return const Scaffold(
      body: Column(
        children: [
          CustomToolbar1(),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(

                  child: Text(
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
                    텍스트11
                    텍스트12
                    텍스트13
                    텍스트14
                    텍스트15
                    텍스트16
                    텍스트17
                    텍스트18
                    텍스트19
                    텍스트20                
                    ''',
                    style: TextStyle(fontSize: 16),
                  ),


                ),
                
              ),
          ),

        ],
      ),
    );
  }

}