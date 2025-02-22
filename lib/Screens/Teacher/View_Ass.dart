import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Appbars/T_Appbar.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Drawer/MatchViewDrawer.dart';
import 'package:plagiarism_detector/Widgets%20Reusable/Half%20Circle%20Indicator/half_indicator.dart';

class AssignmentDetailScreen extends StatelessWidget {
  final String rollNumber;
  final String name;
  final int similarity;
  final String assignmentContent;

  const AssignmentDetailScreen({
    super.key,
    required this.rollNumber,
    required this.name,
    required this.similarity,
    required this.assignmentContent,
  });

  void downloadReport() {
    // Implement download functionality here
    print("Downloading report...");
  }

  @override
  Widget build(BuildContext context) {
    double similarityPercentage = similarity / 100;

    return Scaffold(
      appBar: T_ReusableAppbar(
        title: "Teacher",
        avatarUrl: 'assets/images/Female_Teacher1.png',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      drawer: MatchOverviewDrawer(
        onDownload: downloadReport,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Student Details and Similarity Indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        rollNumber,
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                    ],
                  ),
                  // Wrap the GestureDetector with a Builder widget
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 115,
                              height: 55,
                              child: CustomPaint(
                                painter: HalfCirclePainter(
                                  progress: similarityPercentage,
                                  color: similarity <= 20
                                      ? Colors.green
                                      : similarity <= 50
                                          ? Colors.orange
                                          : Colors.red,
                                  backgroundColor: Colors.grey[200]!,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              child: Text(
                                "$similarity%",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 35,
                              child: Text(
                                "Plagiarised",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Expanded Assignment Content Container
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assignment Content",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          // Text(
                          // assignmentContent,
                          // style: const TextStyle(
                          //   fontSize: 15,
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
