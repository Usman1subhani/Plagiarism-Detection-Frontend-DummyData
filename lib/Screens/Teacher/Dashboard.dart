import 'package:flutter/material.dart';
import 'dart:math';
import 'package:plagiarism_detector/Screens/Teacher/Course_Ass.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Appbars/sliverAppbar.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Course%20Card/TeacherCourseCard.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Scrollable%20Date/ScrollableDate.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Timeline%20List/Timeline_List.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final List<Map<String, dynamic>> courses = [
    {'courseTitle': 'Compiler Construction', 'section': '7A'},
    {'courseTitle': 'Information Security', 'section': '2B'},
    {'courseTitle': 'Mobile App Development', 'section': '1C'},
  ];

  final Map<String, List<Map<String, String>>> tasks = {
    '2024-04-10': [
      {
        'courseTitle': 'Compiler Construction',
        'assignmentTitle': 'Assignment 01',
        'time': '09:00 pm',
        'date': '10 April 2024',
        'fileName': 'Assignment.pdf',
      },
      {
        'courseTitle': 'Compiler Construction',
        'assignmentTitle': 'Assignment 01',
        'time': '09:00 pm',
        'date': '10 April 2024',
        'fileName': 'Assignment.pdf',
      },
    ],
    '2024-04-12': [
      {
        'courseTitle': 'Information Security',
        'assignmentTitle': 'Quiz 01',
        'time': '11:00 am',
        'date': '12 April 2024',
        'fileName': 'Quiz.pdf',
      },
    ],
  };
  String selectedDate = '2024-04-10';
  final List<Color> cardColors = [
    const Color(0xFF6929C4).withOpacity(0.8),
    const Color(0xFFF6AA70).withOpacity(0.8),
    const Color(0xFFFD9491).withOpacity(0.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // Custom Sliver App Bar
          const CustomSliverAppBar(
            studentName: 'Teacher',
            avatarUrl: 'assets/images/Female_Teacher1.png',
          ),

          // Courses Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Courses & Section',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your teaching to:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Course Cards
          SliverToBoxAdapter(
            child: SizedBox(
              height: 195,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TCourseCard(
                      courseTitle: course['courseTitle'],
                      section: course['section'],
                      cardColor: cardColors[index % cardColors.length],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CourseAssignment(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          // Sticky "Recent Uploads" Section with Scrollable Date Bar
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 120.0,
              maxHeight: 120.0,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        'Recent Uploads',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ScrollableDateBar(
                        selectedDate: selectedDate,
                        onDateSelected: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: TimelineList(
            tasks: tasks[selectedDate] ?? [],
          ),
        ),
      ),
    );
  }
}

// A custom delegate to make the SliverPersistentHeader sticky
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
