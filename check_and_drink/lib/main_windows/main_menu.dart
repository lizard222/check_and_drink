import 'package:check_and_drink/main_windows/bottom_navigation_bar.dart';
import 'package:check_and_drink/main_windows/favorites_window.dart';
import 'package:check_and_drink/main_windows/main_window.dart';
import 'package:check_and_drink/main_windows/tab_notifier.dart';
import 'package:check_and_drink/main_windows/user_window.dart';
import 'package:flutter/material.dart';


class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final TabNotifier _tabNotifier = TabNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _tabNotifier,
      builder: (context, value, child) => Scaffold(
       body: _getContent,
      bottomNavigationBar: BottomNavigationBarWidget(tabNotifier: _tabNotifier,),
      ),
    );
  }

  Widget get _getContent{
    switch(_tabNotifier.value){
      case 0: return MainWindowScreen();
      case 1: return FavoritesScreen();
      default: return UserScreen();
    }
  }
}

