import 'package:dcu_new/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dcu_new/screens/AddDailyCheckUpScreen/schedulescreen.dart';
import 'package:dcu_new/screens/AddDailyCheckUpScreen/timeselectionscreen.dart';

class AddDailyCheckUpScreen extends StatefulWidget {
  const AddDailyCheckUpScreen({Key? key}) : super(key: key);

  @override
  _AddDailyCheckUpScreenState createState() => _AddDailyCheckUpScreenState();
}

class _AddDailyCheckUpScreenState extends State<AddDailyCheckUpScreen> {
  DateTime _selectedDate = DateTime.now();
  int _selectedHour = 1;
  int _selectedMinute = 0;

  void _updateSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _updateSelectedTime(int hour, int minute) {
    setState(() {
      _selectedHour = hour;
      _selectedMinute = minute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0C3FF),
      appBar: CustomAppBar(
        title: '',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DatePickerScreen(
                onDateSelected: _updateSelectedDate,
              ),
              TimePickerScreen(
                onTimeSelected: _updateSelectedTime,
              ),
              ElevatedButton(
                onPressed: () {
                  String formattedDate =
                      DateFormat('dd').format(_selectedDate); // Changed to 'dd'
                  String formattedTime =
                      '${_selectedHour.toString().padLeft(2, '0')}:${_selectedMinute.toString().padLeft(2, '0')}';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleScreen(
                        selectedDate: formattedDate,
                        selectedTime: formattedTime,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'APPLY',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
