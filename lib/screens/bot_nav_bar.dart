import 'package:flutter/material.dart';
import 'package:sleep_pad/charts/dashboard_screen.dart';
import 'package:sleep_pad/charts/journal_screen.dart';

import 'home.dart';

class CustomBotNavBar extends StatefulWidget {
  const CustomBotNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBotNavBar> createState() => _CustomBotNavBarState();
}

class _CustomBotNavBarState extends State<CustomBotNavBar> {
  int currentIndex = 3;
  final screens = [
    HomeScreen(),
    JournalScreen(),
    DashBoardScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens
          // get
          // Screens(widget.isAppBar ?? true, widget.appBarSelected ?? 1),
          ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.indigo),
          child: BottomNavigationBar(
            backgroundColor: Colors.indigo,
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(fontSize: 14),
            unselectedLabelStyle: TextStyle(fontSize: 14),
            unselectedItemColor: Colors.white.withOpacity(0.7),
            iconSize: 24,
            unselectedIconTheme: IconThemeData(
              color: Colors.white.withOpacity(0.7),
            ),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                label: 'HOME',
                icon: Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                label: 'JOURNAL',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'DASHBOARD',
                icon: Icon(Icons.settings),
              ),
              BottomNavigationBarItem(
                label: 'SETTINGS',
                icon: Icon(Icons.build),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
