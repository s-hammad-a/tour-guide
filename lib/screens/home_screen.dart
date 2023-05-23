import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0x888496A2),
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            label: "Bookmarks",
            activeIcon: Icon(
              Icons.bookmark,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
