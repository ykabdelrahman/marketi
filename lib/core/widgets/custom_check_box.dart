import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 16,
  });
  final bool value;
  final void Function(bool?)? onChanged;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        side: BorderSide(color: Color(0xFF3F80FF)),
        activeColor: Color(0xFF3F80FF),
      ),
    );
  }
}
