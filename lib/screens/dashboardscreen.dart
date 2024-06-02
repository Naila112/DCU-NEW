import 'package:dcu_new/screens/AddDailyCheckUpScreen/dateselectionscreen.dart';
import 'package:dcu_new/screens/MedicalRecordScreen/medicalrecordapp.dart';
import 'package:dcu_new/widgets/datebox.dart';
import 'package:dcu_new/widgets/greetingbox.dart';
import 'package:dcu_new/widgets/sidebarbox.dart';
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
            const GreetingBox(username: 'Naila'),
            const SizedBox(height: 15),
            buildDateSection1(context),
            const SizedBox(height: 15),
            Container(
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
                    'Add Daily Check-Up',
                    'calendar-plus-96.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddDailyCheckUpScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  buildContentBox(
                    context,
                    'Medical Record',
                    'stethoscope.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedicalRecordScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }

  Widget buildContentBox(BuildContext context, String title, String imageName,
      {required VoidCallback onPressed}) {
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
