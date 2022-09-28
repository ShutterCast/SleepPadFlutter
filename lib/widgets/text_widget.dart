import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final TextOverflow? textOverflow;
  final int? maxLines;
  // final double? wordSpacing;
  // final double? textScaleFactor;
  final TextAlign? textAlign;
  final double? letterSpacing;

  MyText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.overflow,
    // this.lines,
    // this.wordSpacing,
    // this.textScaleFactor,
    this.textAlign,
    this.letterSpacing,
    this.textOverflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      maxLines: maxLines ?? 1,
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        overflow: textOverflow,
        fontSize: fontSize ?? 16,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing ?? 0.5,
      ),
    );
  }
}
