import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String idPegawai = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                  height: 120), // Increased spacing to fit the avatar
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFB0C3FF),
                  ),
                  padding: const EdgeInsets.fromLTRB(50, 80, 50,
                      20), // Adjusted padding to fit the form fields
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 60), // Spacing for the form fields
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Name"),
                            TextFormField(
                              initialValue: 'HaniHani',
                              onSaved: (value) => name = value ?? '',
                            ),
                            const SizedBox(height: 10),
                            const Text("Id Pegawai"),
                            TextFormField(
                              initialValue: '1004',
                              onSaved: (value) => idPegawai = value ?? '',
                            ),
                            const SizedBox(height: 10),
                            const Text("Email"),
                            TextFormField(
                              initialValue: 'Hani@gmail.com',
                              onSaved: (value) => email = value ?? '',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 10),
                            const Text("Password"),
                            TextFormField(
                              obscureText: true,
                              onSaved: (value) => password = value ?? '',
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // Handle save logic here
                                    if (kDebugMode) {
                                      print(
                                          'Name: $name, Id: $idPegawai, Email: $email, Password: $password');
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  textStyle: const TextStyle(fontSize: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: const Text(
                                  'SAVE',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
