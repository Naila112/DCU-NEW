import 'package:dcu_new/screens/dashboardscreen.dart';
import 'package:flutter/material.dart';

import 'pages/homepages.dart';

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
        "/": (context) => DashboardScreen(),
        // "/": (context) => const ProfileScreen(),
      },
    );
  }
}
