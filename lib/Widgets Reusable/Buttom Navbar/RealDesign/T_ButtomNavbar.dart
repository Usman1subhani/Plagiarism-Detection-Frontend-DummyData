// import 'package:flutter/material.dart';
// import 'package:plagiarism_detector/Screens/Teacher/Ass_Creation.dart';
// import 'package:plagiarism_detector/Screens/Teacher/Dashboard.dart';
// import 'package:plagiarism_detector/Screens/Teacher/Profile.dart';

// class TeacherBottomNavBar extends StatefulWidget {
//   final Widget child;

//   const TeacherBottomNavBar({super.key, required this.child});

//   @override
//   // ignore: library_private_types_in_public_api
//   _TeacherBottomNavBarState createState() => _TeacherBottomNavBarState();
// }

// class _TeacherBottomNavBarState extends State<TeacherBottomNavBar> {
//   int _currentIndex = 0;
//   final Color selectedColor = Colors.deepPurple;
//   final Color disabledColor = Colors.grey;

//   // List of screens to navigate to
//   final List<Widget> screens = [
//     const TeacherDashboard(),
//     const Ass_Creation(),
//     const TeacherProfile(),
//   ];

//   void _onTabSelected(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: IndexedStack(
//         index: _currentIndex,
//         children: screens,
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: const CircleBorder(),
//         onPressed: _currentIndex == 1
//             ? null
//             : () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//               },
//         backgroundColor: _currentIndex == 1 ? selectedColor : disabledColor,
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: buildBottomNavigationBar(),
//     );
//   }

//   Widget buildBottomNavigationBar() {
//     return SizedBox(
//       height: 75,
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//         child: BottomAppBar(
//           color: Colors.white,
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               buildNavItem(Icons.home, "Home", 0),
//               const SizedBox(width: 40),
//               buildNavItem(Icons.person, "Profile", 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildNavItem(IconData icon, String label, int index) {
//     return InkWell(
//       onTap: () => _onTabSelected(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             size: 30,
//             color: _currentIndex == index ? selectedColor : disabledColor,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: _currentIndex == index ? selectedColor : disabledColor,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
