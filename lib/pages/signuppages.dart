import 'package:animate_do/animate_do.dart';
import 'package:dcu_new/screens/dashboardscreen.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Formulir untuk SIGN UP
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          FadeInUp(
            duration: const Duration(milliseconds: 1100),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeInUp(
            duration: const Duration(milliseconds: 1200),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Id Pegawai',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeInUp(
            duration: const Duration(milliseconds: 1300),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: <Widget>[
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: MaterialButton(
                  minWidth: 250,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.black,
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
