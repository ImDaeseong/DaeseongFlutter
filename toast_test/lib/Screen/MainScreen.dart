import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widget/CheckboxState.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  //나는 이 방법보다 밑에 코드가 더 익숙
  //@override
  //State<MainScreen> createState() => MainScreenState();

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {

  bool bClick1 = false;
  bool bClick2 = false;
  bool bClick3 = false;
  bool bClick4 = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('toast-test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckBoxState(
              text: 'check1',
              value: bClick1,
              onChanged: (bool? value) {
                setState(() {
                  bClick1 = value ?? false;
                  // 체크박스 선택시 Toast 표시
                  if (value ?? false) showToast(context, 'check1');
                });
              },
            ),

            CheckBoxState(
              text: 'check2',
              value: bClick2,
              onChanged: (bool? value) {
                setState(() {
                  bClick2 = value ?? false;
                  // 체크박스 선택시 Toast 표시
                  if (value ?? false) showToast(context, 'check2');
                });
              },
            ),

            CheckBoxState(
              text: 'check3',
              value: bClick3,
              onChanged: (bool? value) {
                setState(() {
                  bClick3 = value ?? false;
                  // 체크박스 선택시 Toast 표시
                  if (value ?? false) showToast(context, 'check3');
                });
              },
            ),

            CheckBoxState(
              text: 'check4',
              value: bClick4,
              onChanged: (bool? value) {
                setState(() {
                  bClick4 = value ?? false;
                  // 체크박스 선택시 Toast 표시
                  if (value ?? false) showToast(context, 'check4');
                });
              },
            ),

          ],
        ),
      ),

    );
  }


  void showToast(BuildContext context, String sMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(sMsg),
        duration: const Duration(seconds: 2),
      ),
    );
  }

}