import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> messageData =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mess"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Will you have food in mess tomorrow ?"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle "Yes" button press
              },
              child: Text('Yes'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle "No" button press
              },
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}
