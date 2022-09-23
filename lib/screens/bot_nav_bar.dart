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
  int currentIndex = 0;

  // void changeActivePage(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  final screens = [
    HomeScreen(),
    JournalScreen(),
    DashBoardScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.085,
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.indigo),
          child: BottomNavigationBar(
            backgroundColor: Colors.indigo,
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedItemColor: Colors.white.withOpacity(0.7),
            iconSize: 22,
            unselectedIconTheme: IconThemeData(
              size: 22,
              color: Colors.white.withOpacity(0.7),
            ),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                label: 'HOME',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Icons.notifications),
                ),
              ),
              BottomNavigationBarItem(
                label: 'JOURNAL',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Icons.favorite),
                ),
              ),
              BottomNavigationBarItem(
                label: 'DASHBOARD',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Icons.settings),
                ),
              ),
              BottomNavigationBarItem(
                label: 'SETTINGS',
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Icons.build),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
