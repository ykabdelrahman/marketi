import 'package:flutter/material.dart';
import 'package:marketi/core/themes/app_colors.dart';

import '../themes/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.hideText = false,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.height = 50,
    this.textStyle,
    this.maxLength,
    this.maxLines = 1,
    this.radius = 10,
    this.onTap,
    this.autofocus = false,
    this.readOnly = false,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    this.bgColor,
    this.borderSide,
    this.hintOpacity = .5,
    this.hintFontWeight = FontWeight.w400,
    this.hintFontSize = 16,
    this.isLastInput = false,
  });
  final String? hint;
  final TextInputType? keyboardType;
  final bool? hideText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final double? height;
  final int? maxLength;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final void Function()? onTap;
  final bool autofocus;
  final bool readOnly;
  final Color? bgColor;
  final BorderSide? borderSide;
  final double hintOpacity;
  final FontWeight? hintFontWeight;
  final double? hintFontSize;
  final bool isLastInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(radius!),
      ),
      // height: height,
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        textInputAction:
            isLastInput ? TextInputAction.done : TextInputAction.next,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: hideText!,
        cursorColor: Theme.of(context).primaryColor,
        style: textStyle,
        maxLength: maxLength,
        maxLines: maxLines,
        autofocus: autofocus,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: Styles.enRegular12().copyWith(
            color: AppColors.placeholder,
          ),
          focusedBorder: borderStyle(context),
          enabledBorder: borderStyle(context),
          border: borderStyle(context),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle(BuildContext context) {
    return OutlineInputBorder(
      borderSide: borderSide ?? BorderSide(color: AppColors.rect, width: 2),
      borderRadius: BorderRadius.circular(radius!),
    );
  }
}
