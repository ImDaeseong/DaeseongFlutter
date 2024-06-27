import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'alertdialog_test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );

  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            showAlertDialog1(context);
          },
          child: const Text('Button1'),
        ),
        ElevatedButton(
          onPressed: () {
            showAlertDialog2(context);
          },
          child: const Text('Button2'),
        ),
        ElevatedButton(
          onPressed: () {
            showAlertDialog3(context);
          },
          child: const Text('Button3'),
        ),
        ElevatedButton(
          onPressed: () {
            showAlertDialog4(context);
          },
          child: const Text('Button4'),
        ),
      ],
    );
  }

  void showAlertDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildAlertDialog(
          context,
          title: '제목',
          message: '공지사항 내용표현<br>공지사항 내용표현',
          positiveButtonText: '종료',
          negativeButtonText: '취소',

          onPositivePressed: () {
            print('프로그램을 종료');
            Navigator.of(context).pop();
          },
          onNegativePressed: () {
            print('다이얼로그를 취소');
            Navigator.of(context).pop();
          },
        );
      },

    );
  }

  void showAlertDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildAlertDialog(
          context,
          title: '제목',
          message: '공지사항 내용표현<br>공지사항 내용표현',
          positiveButtonText: '종료',
          negativeButtonText: '취소',

          onPositivePressed: () {
            print('프로그램을 종료');
            Navigator.of(context).pop();
          },
          onNegativePressed: () {
            print('다이얼로그를 취소');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void showAlertDialog3(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildAlertDialog(
          context,
          title: '제목',
          message: '공지사항 내용표현<br>공지사항 내용표현',
          positiveButtonText: '종료',
          onPositivePressed: () {
            print('프로그램을 종료');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void showAlertDialog4(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildAlertDialog(
          context,
          title: '<font color="#FF7F27">제목</font>',
          message: '<font color="#FF7F27">공지사항 내용표현<br>공지사항 내용표현</font>',
          positiveButtonText: '종료',
          negativeButtonText: '취소',

          onPositivePressed: () {
            print('프로그램을 종료');
            Navigator.of(context).pop();
          },
          onNegativePressed: () {
            print('다이얼로그를 취소');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }



  AlertDialog buildAlertDialog(
      BuildContext context, {
        required String title,
        required String message,
        required String positiveButtonText,
        String? negativeButtonText,
        required VoidCallback onPositivePressed,
        VoidCallback? onNegativePressed,
      }) {
    return AlertDialog(
      title:Text(title),
      content: SingleChildScrollView(
        child: Text(message),
      ),
      actions: [
        if (negativeButtonText != null)
          TextButton(
              onPressed: () {
                if (onNegativePressed != null) {
                  onNegativePressed();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(negativeButtonText)),

        TextButton(
            onPressed: onPositivePressed,
            child: Text(positiveButtonText)),
      ],
    );
  }

}