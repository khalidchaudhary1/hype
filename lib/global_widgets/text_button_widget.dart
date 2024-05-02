import 'package:flutter/material.dart';

import '../view/view.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.press});
  final String title;
  final String image;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: press,
        icon: image.isNotEmpty ? Image.asset(image) : const SizedBox(),
        label: TextWidget(
          title: title,
          color: bodyTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ));
  }
}
