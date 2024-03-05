import 'package:flutter/material.dart';
import 'package:ptu_hostel/Screens/SiginScreen.dart';
import 'package:ptu_hostel/commonWidgets/appBar.dart';
import 'package:ptu_hostel/commonWidgets/commonNavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ptu_hostel/idform.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _currentIndex = 4; // Set the current index to 4 for the Settings icon

  String _selectedTheme = 'Light'; // Initially selected theme

  List<String> _themes = ['Light', 'Dark', 'Custom']; // List of available themes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false, // Hide the back icon
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('path_to_image'), // Add path to user's image
                  radius: 40,
                ),
                SizedBox(width: 10),
                Text(
                  'User Name', // Replace 'User Name' with the actual user's name
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(), // Add Spacer to push the name to the right
              ],
            ),
            SizedBox(height: 20),
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // SwitchListTile(
            //   title: Text('Notifications'),
            //   value: true,
            //   onChanged: (value) {
            //     // Handle switch state change
            //   },
            // ),
            ListTile(
              title: Text('Theme'),
              trailing: DropdownButton<String>(
                value: _selectedTheme,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTheme = newValue!;
                  });
                },
                items: _themes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Divider(),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              title: Text("SignIn/SignUp"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              title: Text("Fill form"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FillForm()),
                );
              },
            )
          ],
        ),
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
