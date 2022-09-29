import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({Key? key}) : super(key: key);

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
                text: "Heart Rate",
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              Column(
                children: [
                  MyText(
                    text: "A normal heart rate while sleeping is often between 40 to 60 beats per minute (bpm), though there is variability between individuals.",
                    fontSize: 15,
                    maxLines: 6,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  MyText(
                    text: "In general, heart rate is slower during sleep than when a person is awake.",
                    fontSize: 15,
                    maxLines: 3,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  MyText(
                    text: "In the first stages of light sleep, heart rate begins to slow. During deep sleep, the heart rate reaches its lowest levels. In rapid eye movement (REM) sleep, heart rate may speed up to a heart rate similar to when you are awake.",
                    fontSize: 15,
                    maxLines: 7,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  MyText(
                    text:
                        "Sleep problems can have negative impacts on your heart and cardiovascular health, increasing your heart rate and contributing to higher blood pressure. Disorders such as sleep apnea, periodic limb movements, or shift work disorder that interfere with sleep have been linked to a higher chance of developing cardiovascular disease.",
                    fontSize: 15,
                    maxLines: 10,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  )
                ],
              ),
              CircularPercentIndicator(
                radius: MediaQuery.of(context).size.height * 0.18,
                lineWidth: 10,
                percent: 72 / 100,
                animation: true,
                startAngle: 0,
                animationDuration: 2500,
                backgroundColor: Colors.white,
                progressColor: Colors.purple,
                circularStrokeCap: CircularStrokeCap.round,
                center: MyText(
                  text: "72 BPM",
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // MyButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => BodyMovementScreen(),
              //       ),
              //     );
              //   },
              //   title: "Next",
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
