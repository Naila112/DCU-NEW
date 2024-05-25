import 'package:dcu_new/screens/profilescreen.dart';
import 'package:dcu_new/screens/settingscreen.dart';
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
            // icon: CupertinoIcons.person,
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
            // icon: CupertinoIcons.person,
            text: "Medical Record",
            onTap: () {
              // Handle navigation to home screen
            },
          ),
          _buildDrawerItem(
            // icon: Icons.shopping_cart,
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
          // _buildDrawerItem(
          //   icon: Icons.list_alt,
          //   text: "My Wish List",
          // ),
          // _buildDrawerItem(
          //   icon: Icons.settings,
          //   text: "Setting",
          // ),
          // _buildDrawerItem(
          //   icon: Icons.exit_to_app,
          //   text: "Log Out",
          // ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem({
    // required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      // leading: Icon(
      //   icon,
      //   color: Colors.black87,
      //   size: 24,
      // ),
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
