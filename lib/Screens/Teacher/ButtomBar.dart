import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/Teacher/All_Ass_List.dart';
import 'package:plagiarism_detector/Screens/Teacher/Ass_Assigning.dart';
import 'package:plagiarism_detector/Screens/Teacher/Ass_Creation.dart';
import 'package:plagiarism_detector/Screens/Teacher/Course_Ass.dart';
import 'package:plagiarism_detector/Screens/Teacher/Dashboard.dart';
import 'package:plagiarism_detector/Screens/Teacher/Profile.dart';
import 'package:plagiarism_detector/Screens/Teacher/View_Ass.dart';

class TeacherBottomNavBar extends StatefulWidget {
  const TeacherBottomNavBar({super.key});

  @override
  State<TeacherBottomNavBar> createState() => _TeacherBottomNavBarState();
}

class _TeacherBottomNavBarState extends State<TeacherBottomNavBar> {
  int _selectedIndex = 0;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        _navigatorKey.currentState!.pushNamed('/dashboard');
        break;
      case 2:
        _navigatorKey.currentState!.pushNamed('/profile');
        break;
    }
  }

  void _onFloatingActionButtonTapped() {
    setState(() {
      _selectedIndex = 1;
    });
    _navigatorKey.currentState!.pushNamed('/asscreation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/dashboard':
              builder = (BuildContext _) => const TeacherDashboard();
              break;
            case '/asscreation':
              builder = (BuildContext _) => const Ass_Creation();
              break;
            case '/profile':
              builder = (BuildContext _) => const TeacherProfile();
              break;
            case '/assList':
              builder = (BuildContext _) => const All_Ass_List();
              break;
            case '/assigningAss':
              builder = (BuildContext _) => const AssigningAssignment();
              break;
            case '/coursesAss':
              builder = (BuildContext _) => const CourseAssignment();
              break;
            case '/assDetails':
              builder = (BuildContext _) => const AssignmentDetailScreen(
                    rollNumber: '',
                    name: '',
                    similarity: 0,
                    assignmentContent: '',
                  );
              break;
            default:
              builder =
                  (BuildContext _) => const TeacherDashboard(); // Default route
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Empty space for floating button
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: _onFloatingActionButtonTapped,
              backgroundColor:
                  _selectedIndex == 1 ? Colors.deepPurple : Colors.grey,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
