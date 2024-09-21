import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SharedResultScreen extends StatefulWidget {

  final String sID;
  final String sPassword;
  final int sMemberNumber;
  final bool sSaved;
  final String stemp;

  const SharedResultScreen({
    super.key,
    required this.sID,
    required this.sPassword,
    required this.sMemberNumber,
    required this.sSaved,
    required this.stemp,
  });

  @override
  State<StatefulWidget> createState() {
    return SharedResultScreenState();
  }
}

class SharedResultScreenState extends State<SharedResultScreen> {

  final TextEditingController editText10 = TextEditingController();
  final TextEditingController editText11 = TextEditingController();
  final TextEditingController editText12 = TextEditingController();
  final TextEditingController editText13 = TextEditingController();
  final TextEditingController editText14 = TextEditingController();

  @override
  void initState() {
    super.initState();

    editText10.text = widget.sID ?? '';
    editText11.text = widget.sPassword ?? '';
    editText12.text = widget.sMemberNumber.toString();
    editText13.text = widget.sSaved ? "true" : "false";
    editText14.text = widget.stemp ?? '';
  }

  @override
  void dispose() {
    editText10.dispose();
    editText11.dispose();
    editText12.dispose();
    editText13.dispose();
    editText14.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedResultScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(controller: editText10, decoration: const InputDecoration(labelText: 'ID')),
            TextField(controller: editText11, decoration: const InputDecoration(labelText: 'Password')),
            TextField(controller: editText12, decoration: const InputDecoration(labelText: 'Member Number')),
            TextField(controller: editText13, decoration: const InputDecoration(labelText: 'Saved'), readOnly: true),
            TextField(controller: editText14, decoration: const InputDecoration(labelText: 'Temp'), readOnly: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeData,
              child: const Text('changeData'),
            ),

          ],
        ),
      ),
      
    );
  }

  void changeData() {

    if (editText10.text.isEmpty || editText11.text.isEmpty) {
      return;
    }

    Navigator.pop(context, {
      'sID': editText10.text,
      'sPassword': editText11.text,
      'sMemberNumber': int.tryParse(editText12.text) ?? widget.sMemberNumber,
    });
  }

}
