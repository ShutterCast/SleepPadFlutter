import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar({String? text, required bool color}) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color == false ? Colors.red : Colors.green,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
