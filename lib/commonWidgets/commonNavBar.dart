import 'package:flutter/material.dart';
import 'package:ptu_hostel/Screens/ExploreScreen.dart';
import 'package:ptu_hostel/Screens/HomeScreen.dart';
import 'package:ptu_hostel/Screens/MessMenu.dart';
import 'package:ptu_hostel/Screens/SettingScreen.dart';
import 'package:ptu_hostel/Screens/notiScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommonNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final User? user; // Define user variable here

  CommonNavBar({required this.currentIndex, required this.onTap, this.user});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black87,
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotiScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExploreScreen()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessMenuScreen()),
          );
        } else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        } else {
          onTap(index); // Handle other taps normally
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Mess Menu',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.black87,
        ),
      ],
    );
  }
}
