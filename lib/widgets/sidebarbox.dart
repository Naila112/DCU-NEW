import 'package:dcu_new/screens/MedicalRecordScreen/medicalrecordapp.dart';
import 'package:dcu_new/screens/profilescreen.dart';
import 'package:dcu_new/screens/settingscreen.dart';
import 'package:dcu_new/widgets/logoutDialog.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFB0C3FF),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://placehold.co/64x64',
              ),
            ),
            accountName: Padding(
              padding: EdgeInsets.only(top: 30.0), // Tambahkan jarak vertikal
              child: Text(
                'HaniHani',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            accountEmail: Text(
              'Hani@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.person,
            text: "Profile",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.medical_services,
            text: "Medical Record",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MedicalRecordScreen(),
                ),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: "Setting",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            text: "Log Out",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogOutDialog(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black87,
        size: 24,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }
}
