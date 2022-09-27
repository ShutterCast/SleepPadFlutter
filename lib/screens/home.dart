import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleep_pad/screens/start_tracking.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

import '../charts/my_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: MyText(
          text: "Home",
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(alignment: Alignment.topRight, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Column(
              children: [
                MyPercentIndicator(
                  title: "",
                  percent: 75,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: MyText(
                    text: "Battery",
                    fontSize: 12,
                    letterSpacing: 1,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              // color: Colors.grey,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(
                    text: "Welcome!",
                    fontSize: 24,
                    letterSpacing: 1,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(
                    text: "You are all set to improve your sleep \n quality.",
                    fontSize: 18,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    color: Colors.purple,
                    fontWeight: FontWeight.w500,
                  ),
                  MyText(
                    text: "Click on 'Start Monitoring' before going \n to bed.",
                    fontSize: 18,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        onPressed: () {
                          FlutterAlarmClock.showAlarms();
                        },
                        title: "SETUP AN ALARM",
                        color: Colors.amber,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        roundSize: 0,
                      ),
                      MyButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StartTrackingScreen()));
                          // Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (context) => StartTrackingScreen(), maintainState: false));
                        },
                        title: "START MONITORING",
                        color: Colors.amber,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        roundSize: 0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
