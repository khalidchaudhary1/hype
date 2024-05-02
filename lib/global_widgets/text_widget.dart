import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.title,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.textAlign});
  final String title;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontSize: fontSize ?? 15,
      ),
    );
  }
}
