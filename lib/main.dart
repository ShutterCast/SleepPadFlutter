import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleep_pad/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.purple, // status bar color
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleep Pad',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.amber,
      ),
      home: const SplashScreen(),
    );
  }
}
