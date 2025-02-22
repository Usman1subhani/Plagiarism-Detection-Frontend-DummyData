import 'package:flutter/material.dart';

class AssignmentCard extends StatelessWidget {
  final String courseTitle;
  final String assignmentTitle;
  final String time;
  final String date;
  final String fileName;
  final IconData icon;

  const AssignmentCard({
    super.key,
    required this.courseTitle,
    required this.assignmentTitle,
    required this.time,
    required this.date,
    required this.fileName,
    this.icon = Icons.download,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10, // shadow around the card
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Colors.purple, // Start color of gradient
              Colors.deepPurple,
              Colors.deepPurple,
              Color.fromARGB(197, 124, 77, 255), // End color of gradient
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                assignmentTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white70),
                  const SizedBox(width: 10),
                  Text(time,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white70),
                  const SizedBox(width: 10),
                  Text(date,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.file_present, color: Colors.white70),
                  const SizedBox(width: 10),
                  Text(fileName,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16)),
                  IconButton(
                    icon: Icon(icon, color: Colors.white70),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
