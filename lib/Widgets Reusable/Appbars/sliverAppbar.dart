import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String studentName;
  final String avatarUrl;

  const CustomSliverAppBar({
    super.key,
    required this.studentName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      expandedHeight: 110, // Limited height as per your requirement
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double appBarHeight = constraints.maxHeight;
          final bool isExpanded = appBarHeight > 100; // Threshold for expansion
          final double avatarSize = isExpanded ? 45 : 25;

          return Stack(
            children: [
              Positioned(
                bottom: isExpanded ? 15 : 8, // Control vertical positioning
                left: 16,
                right: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: isExpanded
                            ? [
                                Text(
                                  "Hi, $studentName",
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                            : [
                                Text(
                                  studentName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                      ),
                    ),
                    CircleAvatar(
                      radius: avatarSize,
                      backgroundImage: AssetImage(avatarUrl),
                    ),
                  ],
                ),
              ),
              // Optional: Add a subtle shadow at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
