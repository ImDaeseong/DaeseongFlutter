import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timepicker4Screen extends StatefulWidget {
  const Timepicker4Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Timepicker4ScreenState();
  }
}

class Timepicker4ScreenState extends State<Timepicker4Screen> {

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timepicker4Screen'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: selectTime,
            child: const Text('날짜'),
          ),
        ),
    );
  }

  Future<void> selectTime() async {

    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime
    );

    if (pickedTime != null && pickedTime != selectedTime ) {

      setState(() {
        selectedTime = pickedTime;
        print("선택 날짜: ${selectedTime.format(context)}");
      });
    }

  }

}
