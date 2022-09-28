import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyPercentIndicator extends StatelessWidget {
  final String title;
  final double percent;

  const MyPercentIndicator({
    Key? key,
    required this.title,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: MediaQuery.of(context).size.height * 0.063,
      lineWidth: 8,
      percent: percent / 100,
      animation: true,
      startAngle: 0,
      animationDuration: 2500,
      backgroundColor: Colors.white,
      progressColor: Colors.purple,
      circularStrokeCap: CircularStrokeCap.round,
      center: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 10,
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
