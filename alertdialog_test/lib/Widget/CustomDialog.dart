import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialog1(BuildContext context) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('제목'),
          content: const Text('공지사항 내용표현\n공지사항 내용표현'),

          actions: [

            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '종료',
                  style: TextStyle(color: Colors.black),
                ),
            ),

            TextButton(
               onPressed: () {
                 Navigator.of(context).pop();
               },
              child: const Text(
                '취소',
                style:TextStyle(color: Colors.black),
              ),
            ),

          ],
        );
      },
  );

}

void showAlertDialog2(BuildContext context) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('제목'),
        content: const Text('공지사항 내용표현\n공지사항 내용표현'),

        actions: [

          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '종료',
              style: TextStyle(color: Colors.black),
            ),
          ),

        ],
      );
    },
  );

}

void showAlertDialog3(BuildContext context) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),

        child: ConstrainedBox(

          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 20.0,
          ),

          child: IntrinsicHeight(

            child: AlertDialog(
              title: const Text('제목'),
              content: const Text('공지사항 내용표현\n공지사항 내용표현'),

              actions: [
                TextButton(
                  onPressed: () {
                    print('프로그램을 종료');
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '종료',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],

            ),

          ),

        ),
      );
    },
  );
}
