import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dcu_new/widgets/customappbar.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String idPegawai = '';
  String email = '';
  String password = '';
  String _photoUrl = ''; // Url foto profil
  bool _isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Setting',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
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
                              readOnly: !_isEditMode,
                            ),
                            const SizedBox(height: 10),
                            const Text("Id Pegawai"),
                            TextFormField(
                              initialValue: '1004',
                              onSaved: (value) => idPegawai = value ?? '',
                              readOnly: !_isEditMode,
                            ),
                            const SizedBox(height: 10),
                            const Text("Email"),
                            TextFormField(
                              initialValue: 'Hani@gmail.com',
                              onSaved: (value) => email = value ?? '',
                              keyboardType: TextInputType.emailAddress,
                              readOnly: true, // Email tidak dapat diedit
                            ),
                            const SizedBox(height: 10),
                            const Text("Password"),
                            TextFormField(
                              obscureText: true,
                              onSaved: (value) => password = value ?? '',
                              readOnly: !_isEditMode,
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
            child: GestureDetector(
              onTap:
                  _isEditMode ? _uploadPhoto : null, // <-- Here is the change
              child: CircleAvatar(
                radius: 60,
                backgroundColor:
                    Colors.grey[300], // Warna latar belakang avatar
                backgroundImage: _photoUrl.isNotEmpty
                    ? FileImage(File(_photoUrl))
                    : const AssetImage('assets/default_avatar.jpg')
                        as ImageProvider,
                child: _isEditMode && _photoUrl.isEmpty
                    ? const Icon(Icons.camera_alt)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _uploadPhoto() async {
    print('Upload photo function called'); // Tambahkan log
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _photoUrl = pickedFile.path;
      });
    }
  }
}
