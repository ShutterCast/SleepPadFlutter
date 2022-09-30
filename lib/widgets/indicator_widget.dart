import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
        radius: MediaQuery.of(context).size.height * 0.12,
        lineWidth: 5,
        percent: 65 / 100,
        animation: true,
        startAngle: 0,
        animationDuration: 3500,
        backgroundColor: Colors.white,
        progressColor: Colors.purple,
        circularStrokeCap: CircularStrokeCap.round,
        center: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.15,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Image.asset(
            "assets/indicator_image.png",
            fit: BoxFit.cover,
          ),
        ));
  }
}
