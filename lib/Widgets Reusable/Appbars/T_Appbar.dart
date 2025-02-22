import 'package:flutter/material.dart';
import 'package:plagiarism_detector/Screens/Teacher/Profile.dart';

class T_ReusableAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String avatarUrl;
  final VoidCallback onBack;

  const T_ReusableAppbar(
      {super.key,
      required this.title,
      required this.avatarUrl,
      required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 2), // Add bottom border
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        // Use only an IconButton without a Row
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp,
                color: Color(0xFF1B429A)),
            onPressed: onBack),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TeacherProfile(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // Slide from right
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      final tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      final offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(avatarUrl),
                radius: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
