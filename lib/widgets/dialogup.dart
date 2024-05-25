import 'package:flutter/material.dart';

class HealthCheckUpScreen extends StatelessWidget {
  const HealthCheckUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB0C3FF),
              Colors.white,
            ],
            stops: [
              0.3,
              0.3
            ], // Adjusted to make Color(0xFFB0C3FF) take more space
          ),
        ),
        child: Center(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 60),
                SizedBox(height: 12),
                Text(
                  'Successful!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Your Check-Up was successful',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '21 Mei 2024 • 07:00',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      'ID1125079',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'STATUS',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'FIT',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                DetailCheckUpItem(
                  label: 'Tekanan Darah',
                  value: '80mm/Hg',
                ),
                DetailCheckUpItem(
                  label: 'Berat Badan',
                  value: '60kg',
                ),
                DetailCheckUpItem(
                  label: 'Suhu Tubuh',
                  value: '29°C',
                ),
                DetailCheckUpItem(
                  label: 'Denyut Nadi',
                  value: '50Bpm',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailCheckUpItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailCheckUpItem(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
