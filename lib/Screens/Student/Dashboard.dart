import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/Student/Ass_Notify.dart';
import 'package:plagiarism_detector/Screens/Student/Timeline.dart';
import '../../Widgets Reusable/Appbars/sliverAppbar.dart';
import '../../Widgets Reusable/Assignment Card/AssignmentCard.dart';
import '../../Widgets Reusable/Course Card/StudentCourseCard.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final List<Map<String, dynamic>> courses = [
    {'courseTitle': 'Compiler Construction', 'notificationCount': 4},
    {'courseTitle': 'Information Security', 'notificationCount': 2},
    {'courseTitle': 'Mobile App Development', 'notificationCount': 1},
  ];

  final List<Map<String, dynamic>> assignments = [
    {
      'courseTitle': 'Compiler Construction',
      'assignmentTitle': 'Assignment 01',
      'time': '12:00 pm',
      'date': '12 April 2024',
      'fileName': 'Assignment1.pdf'
    },
    {
      'courseTitle': 'Mobile Application',
      'assignmentTitle': 'Assignment 03',
      'time': '12:00 pm',
      'date': '15 April 2024',
      'fileName': 'Assignment3.pdf'
    },
  ];

  final List<Color> cardColors = [
    const Color(0xFF6929C4).withOpacity(0.8),
    const Color(0xFFF6AA70).withOpacity(0.8),
    const Color(0xFFFD9491).withOpacity(0.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom Sliver App Bar
          const CustomSliverAppBar(
            studentName: 'Usman Subhani',
            avatarUrl: 'assets/images/Boy_Student1.png',
          ),

          // Section Header for "Courses"
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Courses',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your running subjects',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Course Cards (Horizontal Scroll)
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
                    child: CourseCard(
                      courseTitle: course['courseTitle'],
                      notificationCount: course['notificationCount'],
                      cardColor: cardColors[index % cardColors.length],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotifyBox()),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          // Section Header for "Your Schedule"
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Schedule',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Upcoming Assignments and Tasks',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Assignment Cards (Vertical Scroll)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final assignment = assignments[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Student_Timeline()),
                    );
                  },
                  child: AssignmentCard(
                    courseTitle: assignment['courseTitle'],
                    assignmentTitle: assignment['assignmentTitle'],
                    time: assignment['time'],
                    date: assignment['date'],
                    fileName: assignment['fileName'],
                  ),
                );
              },
              childCount: assignments.length,
            ),
          ),
        ],
      ),
    );
  }
}
