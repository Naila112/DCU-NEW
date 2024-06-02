import 'package:dcu_new/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicalRecordScreen extends StatefulWidget {
  const MedicalRecordScreen({Key? key}) : super(key: key);

  @override
  _MedicalRecordScreenState createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  DateTime? selectedDate;

  Widget buildDateSection2(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    List<DateTime> daysInMonth = [];
    for (int i = 0; i <= lastDayOfMonth.day - firstDayOfMonth.day; i++) {
      daysInMonth.add(firstDayOfMonth.add(Duration(days: i)));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: daysInMonth.map((date) {
          return buildDateTile(
            day: date.day.toString(),
            date: DateFormat('E').format(date),
            isSelected: selectedDate != null && selectedDate!.day == date.day,
            onTap: () {
              setState(() {
                selectedDate = date;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget buildDateTile({
    required String day,
    required String date,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 60,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB0C3FF) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.blue[300],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk membangun kartu pemeriksaan
  Widget _buildCheckUpCard(String time, String title, String status) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 2,
              height: 80,
              color: const Color(0xFFB0C3FF),
            ),
            const SizedBox(
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Daily Check-Up', // Judul tetap karena ini untuk pemeriksaan harian
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Status: $status',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: const Color(0xFFB0C3FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('MMMM, yyyy').format(now),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildDateSection2(context),
            const SizedBox(height: 32),
            if (selectedDate != null) ...[
              _buildCheckUpCard('07:00 PM', 'Daily Check-Up', 'FIT'),
              const SizedBox(height: 16),
              _buildCheckUpCard('16:00 PM', 'Daily Check-Up', 'FIT'),
            ],
          ],
        ),
      ),
    );
  }
}
