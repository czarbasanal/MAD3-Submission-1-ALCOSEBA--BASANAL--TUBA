import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad3_submission_1/screens/home/home_screen.dart';
import 'package:mad3_submission_1/screens/home/profile_screen.dart';

class HomeWrapper extends StatefulWidget {
  final Widget? child;

  const HomeWrapper({Key? key, this.child}) : super(key: key);

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int currentIndex = 0;

  static const List<Widget> screens = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_fill),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: TextStyle(
          decoration:
              TextDecoration.underline, // Add underline to selected item label
        ),
      ),
    );
  }
}
