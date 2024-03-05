import 'package:flutter/material.dart';
import 'package:ptu_hostel/commonWidgets/appBar.dart';
import 'package:ptu_hostel/commonWidgets/commonNavBar.dart';
class NotiScreen extends StatefulWidget {
  const NotiScreen({super.key});

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {

   int _currentIndex = 1;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: MyAppBar(
          title: 'Notifications', // Pass the title parameter correctly

        ),
        body: Center(
          child: Text('Notification Screen'),
        ),
        bottomNavigationBar: CommonNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // Handle navigation based on index if needed
          },
        ),
      );
  }
}
