import 'package:dcu_new/screens/dashboardscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DAILY CHECK-UP PAG",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        // "/": (context) => const HomePage(),
        // "/": (context) => const LoginPage(),
        "/": (context) => const DashboardScreen(),
        // "/": (context) => const ProfileScreen(),
      },
    );
  }
}
