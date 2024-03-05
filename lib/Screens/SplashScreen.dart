import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ptu_hostel/Screens/HomeScreen.dart';
import 'package:ptu_hostel/Screens/HomeScreen.dart';
import 'package:ptu_hostel/Screens/SiginScreen.dart';
// import 'package:ptu_hostel/Screens/WelcomeScreen.dart'; // Import your main screen file
import 'package:ptu_hostel/main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AuthenticationWrapper(), // Replace MainScreen with your actual main screen widget
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Adjust the background color as needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: 150.0, // Adjust the size of the logo
            ),
            SizedBox(height: 24.0),
            Text(
              'PTU Hostel', // Adjust the app name
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

      ),
    );
  }
}
