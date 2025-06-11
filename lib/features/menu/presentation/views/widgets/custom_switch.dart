import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../../../core/themes/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, this.value = false, required this.onToggle});
  final bool value;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      height: 20,
      width: 46,
      activeColor: AppColors.lightBlue100,
      activeToggleColor: Colors.white,
      inactiveColor: AppColors.placeholder,
      inactiveToggleColor: Colors.white,
      toggleSize: 14,
      padding: 2,
      value: value,
      onToggle: onToggle,
    );
  }
}
