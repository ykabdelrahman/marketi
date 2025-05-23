import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.textColor = Colors.white,
    required this.text,
    this.bgColor,
  });
  final VoidCallback? onTap;
  final Color? textColor;
  final String text;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor ?? AppColors.lightBlue100,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: SizedBox(
          height: 48,
          child: Center(
            child: Text(
              text,
              style: Styles.enMedium18().copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
