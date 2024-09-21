import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SharedPreferencesScreenState();
  }
}

class SharedPreferencesScreenState extends State<SharedPreferencesScreen> {

  final TextEditingController editText5 = TextEditingController();
  final TextEditingController editText6 = TextEditingController();
  final TextEditingController editText7 = TextEditingController();
  final TextEditingController editText8 = TextEditingController();
  final TextEditingController editText9 = TextEditingController();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    editText5.dispose();
    editText6.dispose();
    editText7.dispose();
    editText8.dispose();
    editText9.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferencesScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(controller: editText5, decoration: const InputDecoration(labelText: '아이디')),
            TextField(controller: editText6, decoration: const InputDecoration(labelText: '비밀번호')),
            TextField(controller: editText7, decoration: const InputDecoration(labelText: '회원번호')),
            TextField(controller: editText8, decoration: const InputDecoration(labelText: '저장 여부')),
            TextField(controller: editText9, decoration: const InputDecoration(labelText: 'temp')),

          ],
        ),
        
      ),
      
    );
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      editText5.text = prefs.getString('sID') ?? '';
      editText6.text = prefs.getString('sPassword') ?? '';
      editText7.text = prefs.getInt('sMemberNumber')?.toString() ?? '';
      editText9.text = prefs.getString('stemp') ?? '';
      editText8.text = (prefs.getBool('sSaved') ?? false) ? 'true' : 'false';
    });
  }

}