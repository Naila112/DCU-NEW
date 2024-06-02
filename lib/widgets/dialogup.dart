import 'package:flutter/material.dart';

class HealthCheckUpScreen extends StatelessWidget {
  final String date;
  final String time;

  const HealthCheckUpScreen({
    Key? key,
    required this.date,
    required this.time,
  }) : super(key: key);

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 60),
                const SizedBox(height: 12),
                const Text(
                  'Successful!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Your Check-Up was successful',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$date • $time',
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const Text(
                      'ID1125079',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
                  'STATUS',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'FIT',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                const DetailCheckUpItem(
                  label: 'Tekanan Darah',
                  value: '80mm/Hg',
                ),
                const DetailCheckUpItem(
                  label: 'Berat Badan',
                  value: '60kg',
                ),
                const DetailCheckUpItem(
                  label: 'Suhu Tubuh',
                  value: '29°C',
                ),
                const DetailCheckUpItem(
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

  const DetailCheckUpItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

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
