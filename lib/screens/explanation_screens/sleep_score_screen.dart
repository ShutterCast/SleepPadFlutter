import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../widgets/text_widget.dart';

class SleepScoreScreen extends StatelessWidget {
  const SleepScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                text: "Sleep Score",
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              Column(
                children: [
                  MyText(
                    text: "Your Sleep Score is dependent upon several factors. ",
                    fontSize: 15,
                    maxLines: 2,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  MyText(
                    text:
                        "Our unique algorithm takes into consideration: \n• The amount of time you spend sleeping \n• The amount of time you spend in each sleep cycle \n• The regularity of your sleep (timings) \n• Your movements while sleeping \n• Your respiratory rate while sleeping \n• Your heart rate while sleeping",
                    fontSize: 13,
                    maxLines: 10,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  MyText(
                    text: "Based on all this information, our algorithm calculates your Sleep Score.",
                    fontSize: 14,
                    maxLines: 2,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  MyText(
                    text: "* The more you will use the SLEEP PAD, the more accurate your Sleep Score will be.",
                    fontSize: 13,
                    maxLines: 3,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: MediaQuery.of(context).size.height * 0.18,
                lineWidth: 10,
                percent: 83 / 100,
                animation: true,
                startAngle: 0,
                animationDuration: 2500,
                backgroundColor: Colors.white,
                progressColor: Colors.purple,
                circularStrokeCap: CircularStrokeCap.round,
                center: MyText(
                  text: "83/100",
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // MyButton(
              //   onPressed: () {},
              //   title: "End Demo",
              //   color: Colors.purple,
              //   roundSize: 0,
              //   width: MediaQuery.of(context).size.width * 0.5,
              //   fontSize: 16,
              //   fontWeight: FontWeight.w300,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
