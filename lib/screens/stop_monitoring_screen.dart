import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/text_widget.dart';

class StopMonitoringScreen extends StatelessWidget {
  const StopMonitoringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: MyText(
          text: "Home",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "07:30 AM",
                  color: Colors.purple,
                  maxLines: 6,
                  fontWeight: FontWeight.w500,
                  fontSize: 65,
                  textAlign: TextAlign.center,
                ),
                MyText(
                  text: "Alarm: 07:30 AM",
                  color: Colors.purple,
                  maxLines: 6,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  textAlign: TextAlign.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: MyButton(
                    width: MediaQuery.of(context).size.width * 0.52,
                    onPressed: () {},
                    title: "STOP MONITORING",
                    fontWeight: FontWeight.w400,
                    color: Colors.amber,
                    roundSize: 0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
