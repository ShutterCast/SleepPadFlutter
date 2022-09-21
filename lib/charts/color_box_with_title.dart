import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class ColorBoxWithTitle extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color color;
  const ColorBoxWithTitle({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.018,
              width: MediaQuery.of(context).size.width * 0.030,
              color: color,
            ),
            const SizedBox(
              width: 5,
            ),
            MyText(text: text1, fontWeight: FontWeight.w300, fontSize: 12),
          ],
        ),
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.018,
              width: MediaQuery.of(context).size.width * 0.030,
              color: Colors.transparent,
            ),
            const SizedBox(
              width: 5,
            ),
            MyText(text: text2, fontWeight: FontWeight.w300, fontSize: 12),
          ],
        ),
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.018,
              width: MediaQuery.of(context).size.width * 0.030,
              color: Colors.transparent,
            ),
            const SizedBox(
              width: 5,
            ),
            MyText(text: text3, fontWeight: FontWeight.w300, fontSize: 12),
          ],
        ),
      ],
    );
  }
}
