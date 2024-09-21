import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_test/Screen/SharedPreferencesScreen.dart';
import 'package:sharedpreferences_test/Screen/SharedResultScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {

  final TextEditingController idTextEditing = TextEditingController();
  final TextEditingController passwordTextEditing = TextEditingController();
  final TextEditingController membernumberTextEditing = TextEditingController();
  final TextEditingController tempTextEditing = TextEditingController();
  bool isSaved = false;

  @override
  void initState() {
    super.initState();

    loadSavedData();
  }

  @override
  void dispose() {
    idTextEditing.dispose();
    passwordTextEditing.dispose();
    membernumberTextEditing.dispose();
    tempTextEditing.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sharedpreferences_test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text('아이디', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            TextField(controller: idTextEditing),

            const SizedBox(height: 20),

            const Text('비밀번호', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            TextField(controller: passwordTextEditing, obscureText: true),

            const SizedBox(height: 20),

            const Text('회원번호', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            TextField(controller: membernumberTextEditing, keyboardType: TextInputType.number),

            const SizedBox(height: 20),

            const Text('temp 데이터', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            TextField(controller: tempTextEditing),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: saveData, child: const Text('저장')),
                ElevatedButton(onPressed: removeData, child: const Text('삭제')),
                ElevatedButton(onPressed: clearData, child: const Text('해제')),
                ElevatedButton(onPressed: () => navigateTo(context, const SharedPreferencesScreen()), child: const Text('호출1')),
                ElevatedButton(onPressed: () => navigateToResult(context), child: const Text('호출2')),
              ],
            ),

          ],
        ),
        
      ),

    );
  }

  Future<void> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      idTextEditing.text = prefs.getString('sID') ?? '';
      passwordTextEditing.text = prefs.getString('sPassword') ?? '';
      membernumberTextEditing.text = prefs.getInt('sMemberNumber')?.toString() ?? '';
      tempTextEditing.text = prefs.getString('stemp') ?? '';
      isSaved = prefs.getBool('sSaved') ?? false;
    });
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('sID', idTextEditing.text);
    await prefs.setString('sPassword', passwordTextEditing.text);
    await prefs.setInt('sMemberNumber', int.tryParse(membernumberTextEditing.text) ?? 0);
    await prefs.setString('stemp', tempTextEditing.text);
    await prefs.setBool('sSaved', isSaved);
  }

  Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      idTextEditing.clear();
      passwordTextEditing.clear();
      membernumberTextEditing.clear();
      tempTextEditing.clear();
      isSaved = false;
    });
  }

  Future<void> removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sID');
    await prefs.remove('sPassword');
    await prefs.remove('sMemberNumber');
    await prefs.remove('stemp');

    setState(() {
      idTextEditing.clear();
      passwordTextEditing.clear();
      membernumberTextEditing.clear();
      tempTextEditing.clear();
      isSaved = false;
    });
  }

  void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void navigateToResult(BuildContext context) async {

    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => SharedResultScreen(
          sID: idTextEditing.text,
          sPassword: passwordTextEditing.text,
          sMemberNumber: int.tryParse(membernumberTextEditing.text) ?? 0,
          sSaved: isSaved,
          stemp: tempTextEditing.text,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        idTextEditing.text = result['sID'] ?? idTextEditing.text;
        passwordTextEditing.text = result['sPassword'] ?? passwordTextEditing.text;
        membernumberTextEditing.text = result['sMemberNumber']?.toString() ?? membernumberTextEditing.text;
      });
      await saveData();
    }

  }

}