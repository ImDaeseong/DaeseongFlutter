import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomToolbar2 extends StatelessWidget {
  const CustomToolbar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: const Color(0xFF33b73a),
      child: Row(
        children: [

          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text('검색', style: TextStyle(color: Colors.white, fontSize: 24, ), ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 48,
              height: 48,
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}