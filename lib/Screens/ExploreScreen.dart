import 'package:flutter/material.dart';
import 'package:ptu_hostel/Screens/HomeScreen.dart';
import 'package:ptu_hostel/Screens/createEvent.dart';
import 'package:ptu_hostel/commonWidgets/appBar.dart';
import 'package:ptu_hostel/commonWidgets/commonNavBar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentIndex = 2;

  // Method to navigate to new pages based on index
  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageOne()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageTwo()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageThree()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageFour()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageFive()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Explore',
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        padding: EdgeInsets.all(20.0),
        children: [
          _buildBox(0, Colors.blue, 'Cultural','asset/download.png' ),
          _buildBox(1, Colors.green, 'Sports', 'asset/download.png'),
          _buildBox(2, Colors.red, 'NCC', 'asset/download.png'),
          _buildBox(3, Colors.yellow, 'NSS', 'asset/download.png'),
          _buildBox(4, Colors.deepOrange, 'Bizzare coder', 'asset/download.png'),
          // _buildBox(5, Colors.deepPurpleAccent, 'Other', 'assets/download.png'),
        ],
      ),
      bottomNavigationBar: CommonNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation based on index if needed
          _navigateToPage(index); // You can uncomment this line if you want to navigate to pages from the bottom navigation bar as well.
        },
      ),
    );
  }

  Widget _buildBox(int index, Color color, String text, String imagePath) {
    return GestureDetector(
      onTap: () => _navigateToPage(index),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 100,
                height: 100,

                // Adjust the width and height based on your image size
              ),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sample Pages
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: Center(
        child: Text('Page One'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: Text('Page Two'),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Three'),
      ),
      body: Center(
        child: Text('Page Three'),
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Four'),
      ),
      body: Center(
        child: Text('Page Four'),
      ),
    );
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton( backgroundColor: Colors.deepOrange, onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EventForm()),

        );
      },child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text('Page 5'),
      ),
      body: Center(
        child: Text('Page 5'),
      ),
    );
  }
}
