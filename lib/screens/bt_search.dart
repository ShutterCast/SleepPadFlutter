import 'package:flutter/material.dart';
import 'package:sleep_pad/screens/bot_nav_bar.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class BTSearchScreen extends StatelessWidget {
  const BTSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0,
                ),
                Column(
                  children: [
                    MyText(
                      text: "Congratulations, your SLEEP PAD has \n been successfully connected to the \n App and is ready to use.",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      color: Colors.purple,
                      maxLines: 4,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Image.asset(
                      "assets/read.png",
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.amber,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                MyButton(
                  width: double.maxFinite,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const CustomBotNavBar()), (route) => false);
                  },
                  title: "Next",
                  color: Colors.indigo,
                  fontWeight: FontWeight.w400,
                  roundSize: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
