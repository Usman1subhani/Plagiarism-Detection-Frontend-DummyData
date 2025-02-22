import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Appbars/T_Appbar.dart';
// import 'package:plagiarism_detector/Widgets%20Reusable/Buttom%20Navbar/ButtomNavbar.dart';
import '../../Widgets Reusable/Assignment Card/Submitted_AssCard.dart';

class All_Ass_List extends StatefulWidget {
  const All_Ass_List({super.key});

  @override
  State<All_Ass_List> createState() => _All_Ass_ListState();
}

class _All_Ass_ListState extends State<All_Ass_List> {
  List<Map<String, dynamic>> assignments = [
    {
      "rollNumber": "2021-Arid-0209",
      "name": "Meer Aman Khan",
      "similarity": 0,
    },
    {
      "rollNumber": "2021-Arid-0217",
      "name": "Usman Subhani",
      "similarity": 40,
    },
    {
      "rollNumber": "2021-Arid-0000",
      "name": "Usman Subhani",
      "similarity": 80,
    },
    {
      "rollNumber": "2021-Arid-0217",
      "name": "Usman Subhani",
      "similarity": 100,
    },
    {
      "rollNumber": "2021-Arid-0000",
      "name": "Usman Subhani",
      "similarity": 10,
    },
    {
      "rollNumber": "2021-Arid-0217",
      "name": "Usman Subhani",
      "similarity": 49,
    },
    {
      "rollNumber": "2021-Arid-0000",
      "name": "Usman Subhani",
      "similarity": 59,
    },
    {
      "rollNumber": "2021-Arid-0217",
      "name": "Usman Subhani",
      "similarity": 55,
    },
    // Add other assignments
  ];

  List<Map<String, dynamic>> filteredAssignments = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredAssignments = assignments; // Initially show all assignments
  }

  void _searchAssignments(String query) {
    setState(() {
      searchQuery = query;
      filteredAssignments = assignments
          .where((assignment) => assignment['rollNumber']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: T_ReusableAppbar(
          title: "Teacher",
          avatarUrl: "assets/images/Female_Teacher1.png",
          onBack: Navigator.of(context).pop),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings (From API)
            const Text(
              "Mobile Application",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Assignment 01",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Search bar
            const Text(
              "Search",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            TextField(
              onChanged: _searchAssignments,
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Assignment list
            Expanded(
              child: ListView.builder(
                itemCount: filteredAssignments.length,
                itemBuilder: (context, index) {
                  final assignment = filteredAssignments[index];
                  return SubmittedAssCard(
                    rollNumber: assignment['rollNumber'],
                    name: assignment['name'],
                    similarity: assignment['similarity'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
