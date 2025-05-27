import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, this.onTap, required this.text, this.textStyle});
  final void Function()? onTap;
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Text(text, style: textStyle));
  }
}
