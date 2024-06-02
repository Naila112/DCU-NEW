import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Date Section 1
Widget buildDateSection1(BuildContext context) {
  DateTime now = DateTime.now();
  DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

  List<String> daysInEnglish = [];
  List<int> daysOfMonth = [];

  for (int i = 0; i < 7; i++) {
    DateTime currentDay = firstDayOfWeek.add(Duration(days: i));
    daysInEnglish.add(DateFormat('E').format(currentDay));
    daysOfMonth.add(currentDay.day);
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
                    firstDayOfWeek.add(Duration(days: i)).month == now.month,
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

// // Date Section 2
// Widget buildDateSection2(BuildContext context) {
//   DateTime now = DateTime.now();
//   DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
//   DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

//   List<DateTime> daysInMonth = [];

//   for (int i = 0; i <= lastDayOfMonth.day - firstDayOfMonth.day; i++) {
//     daysInMonth.add(firstDayOfMonth.add(Duration(days: i)));
//   }

//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       children: daysInMonth.map((date) {
//         return buildDateTile(
//           day: date.day.toString(),
//           date: DateFormat('E').format(date),
//           isSelected: date.day == now.day && date.month == now.month,
//           onTap: () {
//             // Logic for what happens when a date is tapped
//             if (kDebugMode) {
//               print('Date tapped: ${date.day}');
//             }
//           },
//         );
//       }).toList(),
//     ),
//   );
// }

// Widget buildDateTile({
//   required String day,
//   required String date,
//   required bool isSelected,
//   required VoidCallback onTap,
// }) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       width: 60,
//       height: 80,
//       decoration: BoxDecoration(
//         color: isSelected ? const Color(0xFFB0C3FF) : Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             day,
//             style: TextStyle(
//               color: isSelected ? Colors.black : Colors.blue[300],
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             date,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
