import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';
import 'authentication_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
          builder: (context) => AuthenticationScreen(),
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
              child: Image.asset(
                "assets/white-logo.png",
                // color: Colors.white,
                fit: BoxFit.fitWidth,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
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
