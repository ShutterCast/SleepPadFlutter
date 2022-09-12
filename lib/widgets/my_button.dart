import 'package:flutter/material.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;
  final Color? textColor;
  final double? roundSize;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  const MyButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.color,
      this.roundSize,
      this.height,
      this.width,
      this.fontSize,
      this.textColor,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (height != null || width != null)
        ? SizedBox(
            height: height,
            width: width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(roundSize ?? 8),
                ),
                primary: color,
              ),
              onPressed: onPressed,
              child: MyText(
                text: title,
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.bold,
                color: textColor ?? Colors.white,
              ),
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(roundSize ?? 8),
              ),
              primary: color,
            ),
            onPressed: onPressed,
            child: MyText(
              textOverflow: TextOverflow.ellipsis,
              text: title,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: textColor ?? Colors.white,
            ),
          );
  }
}
