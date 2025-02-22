import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCard extends StatelessWidget {
  final String courseTitle;
  final int notificationCount;
  final Color cardColor; // For custom card color
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.courseTitle,
    required this.notificationCount,
    required this.cardColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // The main container for the course card
          Container(
            height: 170,
            width: 160,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 8, // Blur radius
                  offset: const Offset(1, 0), // Offset in x and y direction
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 17,
                        backgroundImage:
                            AssetImage('assets/images/Girl_Teacher3.png'),
                      ),
                    ],
                  ),

                  SvgPicture.asset(
                    // SVG icon in the middle row
                    'assets/svgs/books.svg',
                    width: 60,
                    height: 60,
                  ),

                  const SizedBox(height: 3),

                  // Course Title in the last row
                  Text(
                    courseTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Notification badge positioned outside the main container
          Positioned(
            top: -8, // vertical
            right: -8, // horizontal
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              child: Text(
                '$notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
