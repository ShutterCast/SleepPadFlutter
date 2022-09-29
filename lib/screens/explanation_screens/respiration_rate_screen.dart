import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleep_pad/screens/explanation_screens/heart_rate_screen.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class RespirationScreen extends StatelessWidget {
  const RespirationScreen({Key? key}) : super(key: key);

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
                text: "Respiration Rate",
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              Column(
                children: [
                  MyText(
                    text: "The normal respiratory rate of an adult at rest3 is 12 to 20 times per minute. In one study, the average sleep respiratory rate rate for people without sleep apnea was 15 to 16 times a minute.",
                    fontSize: 15,
                    maxLines: 6,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  MyText(
                    text: "Our respiratory rate at rest changes as we grow older4. A range of 12 to 28 breaths per minute is normal for adults between 65 and 80 years old. while a range of 10 to 30 is normal in those over 80 years old.",
                    fontSize: 15,
                    maxLines: 6,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w300,
                  ),
                  MyText(
                    text:
                        "A person's respiratory rate is the number of breaths they take per minute. Like body temperature and heart rate, respiratory rate is a vital sign that can offer a window into a person's overall health. This is true of both your waking and sleeping respiratory rates, as breathing significantly faster or slower than normal while you sleep can be due to a health condition.",
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
                percent: 91 / 100,
                animation: true,
                startAngle: 0,
                animationDuration: 2500,
                backgroundColor: Colors.white,
                progressColor: Colors.purple,
                circularStrokeCap: CircularStrokeCap.round,
                center: MyText(
                  text: "14 BPM",
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
                      builder: (context) => HeartRateScreen(),
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
