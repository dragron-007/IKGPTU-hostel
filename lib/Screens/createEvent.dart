import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import dart:io to use File class
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Form"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Register for an Event',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _image != null
                  ? Image.file(
                File(_image!.path), // Convert XFile to File
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
                  : SizedBox(),
              ElevatedButton(
                onPressed: _getImage,
                child: Text('Upload Image'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _eventNameController,
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Event Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createEvent,
                child: Text('Create event'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _createEvent() async {
    try {
      final eventRef = FirebaseDatabase.instance.reference().child('events');

      final newEventRef = eventRef.push();

      final event = {
        'eventName': _eventNameController.text,
        'eventDescription': _descriptionController.text,
        // Add more fields as needed
      };

      await newEventRef.set(event);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event created successfully')));
      _eventNameController.clear();
      _descriptionController.clear();
      setState(() {
        _image = null;
      });
    } catch (error) {
      print('Error creating event: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error creating event')));
    }
  }

}
