import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timepicker3Screen extends StatefulWidget {
  const Timepicker3Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Timepicker3ScreenState();
  }
}

class Timepicker3ScreenState extends State<Timepicker3Screen> {

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timepicker3Screen'),
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
        print('선택 날짜: ${selectedTime.format(context)}');
      });
    }
  }

}
