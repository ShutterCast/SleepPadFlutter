import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sleep_pad/screens/intro_screen1.dart';

import '../widgets/text_widget.dart';

class SplashScreenHome extends StatefulWidget {
  const SplashScreenHome({Key? key}) : super(key: key);

  @override
  State<SplashScreenHome> createState() => _SplashScreenHomeState();
}

class _SplashScreenHomeState extends State<SplashScreenHome> {
  @override
  void initState() {
    super.initState();
    _navigateTOHome();
  }

  void _navigateTOHome() {
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroScreen1(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _navigateTOHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: "SLEEP PAD",
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(
                    text: "Crafted by Sleepkraft",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyText(
                text: "Copyright 2022. All Rights Reserved",
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
