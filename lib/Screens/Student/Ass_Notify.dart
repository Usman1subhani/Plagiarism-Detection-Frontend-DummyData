import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/Student/Ass_upload.dart';
import '../../Widgets Reusable/Appbars/S_Appbar.dart';

class NotifyBox extends StatelessWidget {
  // Sample data list for assignments
  final List<Map<String, String>> assignments = [
    {"title": "Assignment 01", "dueDate": "12pm / 13-05-2024"},
    {"title": "Assignment 02", "dueDate": "2pm / 15-05-2024"},
    {"title": "Assignment 03", "dueDate": "5pm / 20-05-2024"},
    // Add more assignments as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: S_ReusableAppbar(
        title: "Usman Subhani",
        avatarUrl: "assets/images/Boy_Student1.png",
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Compiler Construction",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6929C4),
              ),
            ),
            Text(
              "You've got ${assignments.length} Assignments",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // ListView to display each assignment notification box
            Expanded(
              child: ListView.builder(
                itemCount: assignments.length,
                itemBuilder: (context, index) {
                  final assignment = assignments[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Ass_Upload()),
                        );
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF3F3F3),
                              Color(0xFFFFFFFF),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(1),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 1,
                                offset: Offset(3, 4))
                          ],
                        ),
                        child: Row(
                          children: [
                            // Circular Subject Code Box
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: const Offset(2, 4),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "CC", // First letters for "Compiler Construction"
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Assignment Information
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  assignment["title"]!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Due: ${assignment["dueDate"]}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
