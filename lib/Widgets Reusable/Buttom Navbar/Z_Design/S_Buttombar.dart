import 'package:flutter/material.dart';

class ZdesignBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ZdesignBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.timeline,
                color: selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
        Positioned(
          top: -30.0,
          left: MediaQuery.of(context).size.width / 2 - 30.0,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => onItemTapped(1),
            backgroundColor: selectedIndex == 1 ? Colors.blue : Colors.grey,
            child: const Icon(
              Icons.timeline,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
