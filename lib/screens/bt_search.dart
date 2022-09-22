import 'package:flutter/material.dart';
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
                MyText(
                  text: "Congratulations, your SLEEP PAD has \n been successfully connected to the \n App and is ready to use.",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.amber,
                ),
                MyButton(
                  width: double.maxFinite,
                  onPressed: () {},
                  title: "Cancel",
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
