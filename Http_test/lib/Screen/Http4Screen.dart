import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class Http4Screen extends StatefulWidget {
  const Http4Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Http4ScreenState();
  }
}

class Http4ScreenState extends State<Http4Screen> {

  String sResponse = '';

  final TextEditingController userTextEditing = TextEditingController();
  final TextEditingController nameTextEditing = TextEditingController();
  final TextEditingController phoneTextEditing = TextEditingController();

  @override
  void initState() {
    super.initState();

    sendPostRequest();

  }

  @override
  void dispose() {

    userTextEditing.dispose();
    nameTextEditing.dispose();
    phoneTextEditing.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Http4Screen'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child : Column(

          children: [

            widgetInputField('회원번호:', userTextEditing),
            widgetInputField('이름:', nameTextEditing),
            widgetInputField('전화번호:', phoneTextEditing, TextInputType.phone),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: sendPostRequest,
              child: const Text('보내기'),
            ),

            const SizedBox(height: 20),

            Text(
              sResponse,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),

          ],
        ),

      ),

    );
  }

  Widget widgetInputField(String label, TextEditingController controller, [TextInputType inputType = TextInputType.text]) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(

        children: [

          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: label.trim()),
                keyboardType: inputType,
              ),
          ),

        ],

      ),

    );
  }

  Future<void> sendPostRequest() async {

    final String sUser = userTextEditing.text;
    final String sName = nameTextEditing.text;
    final String sPhone = phoneTextEditing.text;

    if (sUser.isEmpty || sName.isEmpty || sPhone.isEmpty) {
      setState(() {
        sResponse = '모든 필드를 입력해주세요.';
      });
      return;
    }

    final Map<String, String> postParams = {
      'USERNO': sUser,
      'NAME': sName,
      'PHONE': sPhone,
    };
    const String sUrl = 'https://your-api-url.com'; // 실제 API URL로 변경 필요

    try {

      final response = await http.post(
        Uri.parse(sUrl),
        body: postParams,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      setState(() {
        sResponse = response.body;
      });

    } catch (e) {

      setState(() {
        sResponse = '오류: $e';
      });

    }

  }

}