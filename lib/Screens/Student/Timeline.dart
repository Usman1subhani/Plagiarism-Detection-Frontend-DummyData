import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Appbars/S_Appbar.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Scrollable%20Date/ScrollableDate.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Timeline%20List/Timeline_List.dart';

class Student_Timeline extends StatefulWidget {
  const Student_Timeline({super.key});

  @override
  State<Student_Timeline> createState() => _Student_TimelineState();
}

class _Student_TimelineState extends State<Student_Timeline> {
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
        'courseTitle': 'Mobile Application',
        'assignmentTitle': 'Assignment 02',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: S_ReusableAppbar(
        title: 'Usman Subhani',
        avatarUrl: 'assets/images/Boy_Student1.png',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "You've got",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${tasks.length} tasks Today",
                    //"1 tasks Today",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Scrollable Date Bar Widget
          ScrollableDateBar(
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          // Timeline List Widget
          Expanded(
            child: TimelineList(
              tasks: tasks[selectedDate] ?? [],
            ),
          ),
        ],
      ),
    );
  }
}
