import 'package:dcu_new/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:dcu_new/widgets/dialogup.dart';
import 'package:intl/intl.dart';

// Model untuk jadwal
class Schedule {
  final String date;
  final String time;

  Schedule({required this.date, required this.time});
}

class ScheduleScreen extends StatefulWidget {
  final String selectedDate;
  final String selectedTime;

  const ScheduleScreen({
    Key? key,
    required this.selectedDate,
    required this.selectedTime,
  }) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<Schedule> schedules = []; // Menggunakan model Schedule

  @override
  void initState() {
    super.initState();
    // Tambahkan jadwal yang dipilih ke dalam daftar jadwal saat widget diinisialisasi
    _addSchedule(widget.selectedDate, widget.selectedTime);
  }

  void _addSchedule(String date, String time) {
    setState(() {
      schedules.add(Schedule(
          date: date, time: time)); // Tambahkan jadwal menggunakan model
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
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
              Row(
                children: [
                  Text(
                    DateFormat('MMMM, yyyy').format(now),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ScheduleCard(
                      date: schedules[index].date,
                      time: schedules[index].time,
                      onTap: () {
                        // Berpindah ke layar detail pemeriksaan kesehatan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HealthCheckUpScreen(
                              date: schedules[index].date,
                              time: schedules[index].time,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String date;
  final String time;
  final VoidCallback onTap;

  const ScheduleCard({
    Key? key,
    required this.date,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                date,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Text(
              'Daily Check-Up\n$time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
