import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/loginnnn.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Color(0xFF1B429A),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.30,
              backgroundImage:
                  const AssetImage('assets/images/Female_Teacher1.png'),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: screenWidth,
              color: const Color.fromARGB(255, 248, 243, 243),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.08,
                  vertical: screenHeight * 0.03),
              child: Column(
                children: [
                  profileItem(
                    icon: Icons.person_4_outlined,
                    color: Colors.deepPurple,
                    label: 'Teacher',
                    screenWidth: screenWidth,
                  ),
                  const Divider(),
                  profileItem(
                    icon: Icons.assessment_outlined,
                    color: Colors.deepPurple,
                    label: '2222-Arid-1111',
                    screenWidth: screenWidth,
                  ),
                  const Divider(),
                  profileItem(
                    icon: Icons.email_outlined,
                    color: Colors.deepPurple,
                    label: 'teacher@gmail.com',
                    screenWidth: screenWidth,
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false,
                      );
                    },
                    child: profileItem(
                      icon: Icons.logout_outlined,
                      color: Colors.red,
                      label: 'Logout',
                      screenWidth: screenWidth,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileItem({
    required IconData icon,
    required Color color,
    required String label,
    required double screenWidth,
  }) {
    return Row(
      children: [
        Container(
          height: screenWidth * 0.18,
          width: screenWidth * 0.18,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(icon, color: Colors.white, size: screenWidth * 0.1),
        ),
        SizedBox(width: screenWidth * 0.08),
        Flexible(
          child: Text(
            label,
            style: TextStyle(
                fontSize: screenWidth * 0.055, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
