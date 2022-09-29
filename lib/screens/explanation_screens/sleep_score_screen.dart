import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../widgets/my_button.dart';
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
                text: "Respiration Rate",
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              Column(
                children: [
                  MyText(
                    text: "Your Sleep Score is based on the amount of time you sleep and the average time you spend in each sleep cycle. This is then compared to the Benchmark",
                    fontSize: 15,
                    maxLines: 5,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  MyText(
                    text: "Knowing how much time youspend in each sleep stage can help you understand your energy levels andfluctuations during the day.",
                    fontSize: 15,
                    maxLines: 4,
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
              MyButton(
                onPressed: () {},
                title: "End Demo",
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
