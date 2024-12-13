import 'package:check_and_drink/main_windows/tab_notifier.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({required this.tabNotifier});

  final TabNotifier tabNotifier;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(30),
      child: BottomNavigationBar(
        currentIndex: tabNotifier.value,
        onTap: (value) => tabNotifier.value = value,
        backgroundColor: Color.fromARGB(255, 128, 0, 32).withOpacity(0.7),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30, color: Colors.white),
              activeIcon: Icon(Icons.home, size: 30, color: Colors.black),
              label: "Главное"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30, color: Colors.white),
              activeIcon: Icon(Icons.favorite, size: 30, color: Colors.black),
              label: "Избранное"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30, color: Colors.white),
              activeIcon: Icon(Icons.person, size: 30, color: Colors.black),
              label: "Личный кабинет"),
        ],
      ),
    );
  }
}
