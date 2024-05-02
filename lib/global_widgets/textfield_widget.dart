import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffix,
  });
  final TextEditingController controller;
  final String? hintText;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          fillColor: const Color(0xff1A1A1A),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xffA1A3A5),
              fontSize: 13),
          suffixIcon: suffix,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none)),
    );
  }
}
