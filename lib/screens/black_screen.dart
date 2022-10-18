import 'package:flutter/material.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/white-logo.png",
            // color: Colors.white,
            fit: BoxFit.fitWidth,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          SizedBox(height: 15),
          MyText(
            text: "Welcome",
            color: Colors.white,
            fontSize: 40,
          ),
          SizedBox(height: 50),
          MyText(
            text: "Device is in Pairing Mode.........",
            color: Colors.white,
            fontSize: 18,
          ),
        ],
      )),
    );
  }
}
