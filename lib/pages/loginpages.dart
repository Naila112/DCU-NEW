import 'package:animate_do/animate_do.dart';
import 'package:dcu_new/screens/dashboardscreen.dart';
import 'package:flutter/material.dart';

import 'signuppages.dart';

class RegistasiPage extends StatefulWidget {
  const RegistasiPage({Key? key}) : super(key: key);

  @override
  _RegistasiPageState createState() => _RegistasiPageState();
}

class _RegistasiPageState extends State<RegistasiPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0C3FF),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              color: isLogin ? Colors.black : Colors.white54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              decoration: isLogin
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: !isLogin ? Colors.black : Colors.white54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              decoration: !isLogin
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FadeInUp(
                  duration: const Duration(milliseconds: 1100),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2.1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon/onlinephone.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                isLogin ? const LoginForm() : const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          FadeInUp(
            duration: const Duration(milliseconds: 1200),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                filled: true, // Mengaktifkan background filled
                fillColor:
                    Colors.white, // Memberikan warna putih pada background
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeInUp(
            duration: const Duration(milliseconds: 1300),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true, // Mengaktifkan background filled
                fillColor:
                    Colors.white, // Memberikan warna putih pada background
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 50),
          Column(
            children: <Widget>[
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: MaterialButton(
                  minWidth: 250,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.black,
                  child: const Text(
                    "LOG IN",
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
