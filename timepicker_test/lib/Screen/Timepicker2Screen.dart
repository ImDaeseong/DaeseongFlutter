import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Timepicker2Screen extends StatefulWidget {
  const Timepicker2Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Timepicker2ScreenState();
  }
}

class Timepicker2ScreenState extends State<Timepicker2Screen> {

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timepicker2Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                '선택 날짜: ${formatTime(selectedTime)}',
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  selectTime(context);
                },
                child: const Text('날짜'),
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
        print("선택 날짜: ${formatTime(selectedTime)}");
      });
    }

  }

  // 시간 포맷
  String formatTime(TimeOfDay time) {

    final now = DateTime.now();
    final formattedTime = DateFormat.jm().format(
      DateTime(now.year, now.month, now.day, time.hour, time.minute),
    );

    return formattedTime;
  }

}
