import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildDateSection(BuildContext context) {
  DateTime now = DateTime.now();
  DateTime firstDayOfMonth =
      DateTime(now.year, now.month, now.day - now.weekday + 1);
  DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

  List<String> daysInEnglish = [];
  for (int i = 0; i < 7; i++) {
    daysInEnglish
        .add(DateFormat('E').format(firstDayOfMonth.add(Duration(days: i))));
  }

  List<int> daysOfMonth = [];

  int startDayIndex =
      firstDayOfMonth.weekday - 1; // Adjust start day to start from Monday
  for (int i = 0; i < 7; i++) {
    DateTime currentDate =
        firstDayOfMonth.add(Duration(days: i - startDayIndex));
    if (currentDate.isBefore(lastDayOfMonth.add(const Duration(days: 1)))) {
      daysOfMonth.add(currentDate.day);
    } else {
      daysOfMonth.add(0);
    }
  }

  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < 7; i++)
              buildDayBox(
                day: daysOfMonth[i],
                dayName: daysInEnglish[i],
                isToday: daysOfMonth[i] == now.day &&
                    now.month == firstDayOfMonth.month,
                context: context,
              ),
          ],
        ),
      ],
    ),
  );
}

Widget buildDayBox({
  required int day,
  required String dayName,
  required bool isToday,
  required BuildContext context,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 1),
    width: 50,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.black, width: 1.5),
      color: isToday ? const Color(0xFFB0C3FF) : null,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            fontSize: 17,
          ),
        ),
        Text(
          dayName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
