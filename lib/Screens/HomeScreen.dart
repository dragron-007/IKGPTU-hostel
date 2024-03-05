import 'package:flutter/material.dart';
import 'package:ptu_hostel/commonWidgets/appBar.dart';
import 'package:ptu_hostel/commonWidgets/commonNavBar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'College Buddy', // Pass the title parameter correctly

      ),
      body: Center(
        child: Text('Home Page'),
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
