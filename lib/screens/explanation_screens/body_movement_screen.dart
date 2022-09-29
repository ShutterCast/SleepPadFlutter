import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleep_pad/screens/explanation_screens/sleep_score_screen.dart';

import '../../widgets/my_button.dart';
import '../../widgets/text_widget.dart';

class BodyMovementScreen extends StatelessWidget {
  const BodyMovementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              tileMode: TileMode.clamp,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff371f56),
                Color(0xff0d0628),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyText(
                text: "Body Movement",
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              Column(
                children: [
                  MyText(
                    text:
                        "People commonly shift and move around after getting into bed. For most of us, this movement. slows once we find a comfortable position and fall asleep. But for millions of people diagnosed with a sleep-related movement disorder, nighttime movements increase before or during sleep.",
                    fontSize: 15,
                    maxLines: 8,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  MyText(
                    text: "Abnormal movements can make it difficult to get sufficient, quality rest.",
                    fontSize: 15,
                    maxLines: 10,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: MediaQuery.of(context).size.height * 0.18,
                lineWidth: 10,
                percent: 75 / 100,
                animation: true,
                startAngle: 0,
                animationDuration: 2500,
                backgroundColor: Colors.white,
                progressColor: Colors.purple,
                circularStrokeCap: CircularStrokeCap.round,
                center: MyText(
                  text: "8 Times",
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
              MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SleepScoreScreen(),
                    ),
                  );
                },
                title: "Next",
                color: Colors.purple,
                roundSize: 0,
                width: MediaQuery.of(context).size.width * 0.5,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
