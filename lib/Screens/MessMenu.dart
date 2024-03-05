import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ptu_hostel/commonWidgets/commonNavBar.dart';

// Define a class to represent a meal
class Meal {
  final String name;

  Meal(this.name);
}

// Define a class to represent a menu item
class MenuItem {
  final String dish;

  MenuItem(this.dish);
}

class MessMenuScreen extends StatefulWidget {
  const MessMenuScreen({Key? key}) : super(key: key);

  @override
  State<MessMenuScreen> createState() => _MessMenuScreenState();
}

class _MessMenuScreenState extends State<MessMenuScreen> {
  late List<List<MenuItem>> menu;
  int _currentIndex = 3; // Define _currentIndex here

  @override
  void initState() {
    super.initState();
    generateMenu();
  }

  // Generate random dishes for each meal for each day
  void generateMenu() {
    final meals = [
      Meal('Breakfast'),
      Meal('Lunch'),
      Meal('Dinner'),
    ];

    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    final random = Random();
    menu = List.generate(7, (dayIndex) {
      return List.generate(3, (mealIndex) {
        final dishIndex = random.nextInt(10); // Just for example
        return MenuItem('Dish ${dishIndex + 1}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ['Breakfast', 'Lunch', 'Dinner'];
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    if (menu == null) {
      // Menu is not initialized yet, show a loading indicator or return an empty container
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mess Menu'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 10, // Adjust the spacing between columns
            dataRowHeight: 50, // Adjust the height of rows
            horizontalMargin: 10, // Adjust the margin on both sides
            columns: [
              DataColumn(
                label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the padding
                  child: Text('Day'),
                ),
              ),
              ...meals.map(
                    (meal) => DataColumn(
                  label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the padding
                    child: Text(meal),
                  ),
                ),
              ),
            ],
            rows: List.generate(7, (index) {
              return DataRow(cells: [
                DataCell(
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the padding
                    child: Text(days[index]),
                  ),
                ),
                ...List.generate(3, (mealIndex) {
                  return DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the padding
                      child: Text(menu[index][mealIndex].dish),
                    ),
                  );
                }),
              ]);
            }),
          ),
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
