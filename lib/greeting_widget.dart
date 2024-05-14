import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildGreetingBox(BuildContext context, String username) {
  // Mendapatkan waktu saat ini
  DateTime now = DateTime.now();
  int hour = now.hour;

  // Menentukan teks berdasarkan waktu
  String greeting = '';
  if (hour < 12) {
    greeting = 'Good Morning';
  } else if (hour < 18) {
    greeting = 'Good Afternoon';
  } else {
    greeting = 'Good Evening';
  }

  // Kembalikan widget yang akan ditampilkan
  return Container(
    padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProfileScreen(
                //       fullName: 'Naila',
                //       idNumber: '123456',
                //       dateOfBirth: '07/07/2007',
                //       gender: 'Perempuan',
                //       city: 'Lhokseumawe',
                //       phoneNumber: '081234567891',
                //       email: 'naila@gmail.com',
                //     ),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$greeting, $username',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5), // Jarak antara greeting dan tanggal
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
          ],
        ),
        const SizedBox(height: 10), // Jarak antara greeting dan tanggal
      ],
    ),
  );
}
