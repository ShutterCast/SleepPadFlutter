import 'package:flutter/material.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class StartTrackingScreen extends StatelessWidget {
  const StartTrackingScreen({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  text: "Make sure your Bluetooth is switched\n on and connected to your SLEEP PAD.\nPlease make sure that your smart\ndevice is in close proximity to your\nSLEEP PAD while sleeping.",
                  color: Colors.purple,
                  maxLines: 6,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  textAlign: TextAlign.center,
                ),
                MyButton(
                  width: MediaQuery.of(context).size.width * 0.4,
                  onPressed: () {},
                  title: "CONTINUE",
                  fontWeight: FontWeight.w400,
                  color: Colors.amber,
                  roundSize: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
