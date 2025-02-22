import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/Teacher/View_Ass.dart';

class SubmittedAssCard extends StatelessWidget {
  final String rollNumber;
  final String name;
  final int similarity;

  const SubmittedAssCard({
    super.key,
    required this.rollNumber,
    required this.name,
    required this.similarity,
  });

  @override
  Widget build(BuildContext context) {
    Color similarityColor;
    if (similarity <= 20) {
      similarityColor = Colors.green;
    } else if (similarity <= 50) {
      similarityColor = Colors.orange;
    } else {
      similarityColor = Colors.red;
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentDetailScreen(
              rollNumber: rollNumber,
              name: name,
              similarity: similarity,
              assignmentContent: 'Sample assignment content from API...',
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFF3F3F3),
              Color(0xFFFFFFFF),
            ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 1, offset: Offset(3, 4))
            ]),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          title: Text(
            rollNumber,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon:
                    const Icon(Icons.download, color: Colors.deepPurpleAccent),
                onPressed: () {
                  // Download action
                },
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: similarityColor.withOpacity(0.1),
                child: Text(
                  '$similarity%',
                  style: TextStyle(
                    color: similarityColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
