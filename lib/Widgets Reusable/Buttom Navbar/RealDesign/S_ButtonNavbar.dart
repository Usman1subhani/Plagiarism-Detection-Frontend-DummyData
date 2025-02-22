import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/Teacher/Ass_Creation.dart';
import 'package:plagiarism_detector/Screens/Teacher/Dashboard.dart';
import 'package:plagiarism_detector/Screens/Teacher/Profile.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  final Color selectedColor = Colors.deepPurple;
  final Color disabledColor = Colors.grey;
  //List of screens to navigate to final
  List<Widget> screens = [
    const TeacherDashboard(),
    const Ass_Creation(),
    const TeacherProfile(),
  ];
  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: _currentIndex == 1
            ? null
            : () {
                setState(() {
                  _currentIndex = 1;
                });
              },
        backgroundColor: _currentIndex == 1 ? selectedColor : disabledColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return SizedBox(
      height: 75,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: () => _onTabSelected(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 31,
                      color: _currentIndex == 0 ? selectedColor : disabledColor,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color:
                            _currentIndex == 0 ? selectedColor : disabledColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              InkWell(
                onTap: () => _onTabSelected(2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 31,
                      color: _currentIndex == 2 ? selectedColor : disabledColor,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color:
                            _currentIndex == 2 ? selectedColor : disabledColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
