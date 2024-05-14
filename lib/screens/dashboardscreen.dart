import 'package:dcu_new/date_widgets.dart';
import 'package:dcu_new/greeting_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildGreetingBox(context, ''),
            buildDateSection(context),
            const SizedBox(height: 20),
            buildBox(context),
          ],
        ),
      ),
    );
  }

  Widget buildBox(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFB0C3FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          buildContentBox(
            context,
            'Data Karyawan',
            'treatment.png',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const DataKaryawanScreen(),
              //   ),
              // );
            },
          ),
          const SizedBox(height: 5),
          buildContentBox(
            context,
            'Medical Record',
            'stethoscope.png',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const MedicalRecordScreen(),
              //   ),
              // );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget buildContentBox(BuildContext context, String title, String imageName,
      {required VoidCallback? onPressed}) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            buildImage(imageName),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
          child: Image.asset(
            'assets/icon/$imageName',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
