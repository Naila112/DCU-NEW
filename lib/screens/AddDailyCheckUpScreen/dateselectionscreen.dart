import 'package:dcu_new/screens/AddDailyCheckUpScreen/timeselectionscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dcu_new/screens/AddDailyCheckUpScreen/schedulescreen.dart';

class AddDailyCheckUpScreen extends StatefulWidget {
  const AddDailyCheckUpScreen({Key? key}) : super(key: key);

  @override
  _AddDailyCheckUpScreenState createState() => _AddDailyCheckUpScreenState();
}

class _AddDailyCheckUpScreenState extends State<AddDailyCheckUpScreen> {
  final DateTime _selectedDate = DateTime.now();
  final int _selectedHour = 1;
  final int _selectedMinute = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0C3FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 10.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.5, // Change to _progressValue if needed
                        child: Container(
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const DatePickerScreen(),
              const TimePickerScreen(),
              ElevatedButton(
                onPressed: () {
                  String formattedDate =
                      DateFormat('dd MMM').format(_selectedDate);
                  String formattedTime = '$_selectedHour:$_selectedMinute';
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
