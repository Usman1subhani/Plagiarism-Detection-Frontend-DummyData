import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plagiarism_detector/Screens/Student/Dashboard.dart';
import 'package:plagiarism_detector/Screens/Student/Profile.dart';
import 'package:plagiarism_detector/Screens/Student/Timeline.dart';
import 'package:plagiarism_detector/Screens/Student/Ass_Notify.dart';
import 'package:plagiarism_detector/Screens/Student/Ass_upload.dart';

class StudentBottomNavBar extends StatefulWidget {
  const StudentBottomNavBar({super.key});

  @override
  State<StudentBottomNavBar> createState() => _StudentBottomNavBarState();
}

class _StudentBottomNavBarState extends State<StudentBottomNavBar> {
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
    _navigatorKey.currentState!.pushNamed('/timeline');
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
              builder = (BuildContext _) => const StudentDashboard();
              break;
            case '/timeline':
              builder = (BuildContext _) => const Student_Timeline();
              break;
            case '/profile':
              builder = (BuildContext _) => const StudentProfile();
              break;
            case '/notify':
              builder = (BuildContext _) => NotifyBox();
              break;
            case '/upload':
              builder = (BuildContext _) => const Ass_Upload();
              break;
            default:
              builder =
                  (BuildContext _) => const StudentDashboard(); // Default route
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
              child: SvgPicture.asset(
                'assets/svgs/timeline.svg',
                width: 28,
                height: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
