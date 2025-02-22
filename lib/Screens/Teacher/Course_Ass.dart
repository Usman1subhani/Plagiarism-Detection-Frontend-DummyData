import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/Teacher/All_Ass_List.dart';
import 'package:plagiarism_detector/Screens/Teacher/Ass_Assigning.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Appbars/T_Appbar.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Assignment%20Card/AssignmentCard.dart';

class CourseAssignment extends StatefulWidget {
  const CourseAssignment({super.key});

  @override
  State<CourseAssignment> createState() => _CourseAssignmentState();
}

class _CourseAssignmentState extends State<CourseAssignment> {
  final List<Map<String, dynamic>> assignments = [
    {
      'courseTitle': 'Compiler Construction',
      'assignmentTitle': 'Assignment 01',
      'time': '12:00 pm',
      'date': '12 April 2024',
      'fileName': 'Assignment1.pdf'
    },
    {
      'courseTitle': 'Compiler Construction',
      'assignmentTitle': 'Assignment 02',
      'time': '12:00 pm',
      'date': '15 April 2024',
      'fileName': 'Assignment2.pdf'
    },
    {
      'courseTitle': 'Compiler Construction',
      'assignmentTitle': 'Assignment 03',
      'time': '12:00 pm',
      'date': '15 April 2024',
      'fileName': 'Assignment3.pdf'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: T_ReusableAppbar(
        title: 'Teacher',
        avatarUrl: 'assets/images/Female_Teacher1.png',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Static course details section
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Compiler Construction",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Bcs - 4A",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Button to create a new assignment
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.6, // 60% of screen width
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AssigningAssignment()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Create Assignment",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Scrollable list section for assignments
          Expanded(
            child: ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                final assignment = assignments[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const All_Ass_List()));
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
            ),
          ),
        ],
      ),
    );
  }
}
