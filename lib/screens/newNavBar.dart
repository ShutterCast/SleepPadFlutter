import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../charts/dashboard_screen.dart';
import '../charts/journal_screen.dart';
import 'home.dart';

class NewBar extends StatefulWidget {
  const NewBar({Key? key}) : super(key: key);

  @override
  State<NewBar> createState() => _NewBarState();
}

class _NewBarState extends State<NewBar> {
  PersistentTabController? _controller;

  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const JournalScreen(),
    const DashBoardScreen(),
    const HomeScreen(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("HOME"),
        inactiveColorPrimary: Colors.white.withOpacity(0.7),
        activeColorPrimary: Colors.white,
        iconSize: 22,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("JOURNAL"),
        inactiveColorPrimary: Colors.white.withOpacity(0.7),
        activeColorPrimary: Colors.white,
        iconSize: 22,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("DASHBOARD"),
        inactiveColorPrimary: Colors.white.withOpacity(0.7),
        activeColorPrimary: Colors.white,
        iconSize: 22,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.build),
        title: ("SETTINGS"),
        inactiveColorPrimary: Colors.white.withOpacity(0.7),
        activeColorPrimary: Colors.white,
        iconSize: 22,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: MediaQuery.of(context).size.height * 0.085,
      context,
      controller: _controller,
      screens: screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.indigo,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
