import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timepicker1Screen extends StatefulWidget {
  const Timepicker1Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Timepicker1ScreenState();
  }
}

class Timepicker1ScreenState extends State<Timepicker1Screen> {

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timepicker1Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                selectTime(context);
              },
              child: const Text('날짜'),
            ),

            const SizedBox(height: 20),

            Text(
              '선택 날짜: ${selectedTime.format(context)}',
              style: const TextStyle(fontSize: 20),
            ),

          ],
        ),
      )

    );
  }


  Future<void> selectTime(BuildContext context) async {

    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime
    );

    if (pickedTime != null && pickedTime != selectedTime ) {

      setState(() {
        selectedTime = pickedTime;
      });
    }

    print('선택 날짜: ${pickedTime?.hour}:${pickedTime?.minute}');
  }

}