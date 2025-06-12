import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import 'custom_switch.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.isLogOut = false,
    this.isSwitch = false,
    this.value = false,
    this.onToggle,
  });
  final IconData icon;
  final String text;
  final void Function()? onTap;
  final bool isLogOut;
  final bool isSwitch;
  final bool? value;
  final Function(bool)? onToggle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      splashColor: const Color(0xff022B3A).withValues(alpha: .15),
      child: Padding(
        padding: EdgeInsets.only(right: 24, left: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 14),
            Row(
              children: [
                Icon(
                  icon,
                  color:
                      isLogOut ? AppColors.darkRed200 : AppColors.darkBlue900,
                ),
                const SizedBox(width: 16),
                Text(
                  text,
                  style: Styles.enMedium16().copyWith(
                    color: AppColors.darkBlue900,
                  ),
                ),
                const Spacer(),
                isSwitch
                    ? CustomSwitch(onToggle: onToggle!, value: value!)
                    : Icon(Icons.arrow_forward_ios, size: 22),
              ],
            ),
            SizedBox(height: 14),
            if (!isLogOut)
              Divider(
                color: const Color(0xff022B3A).withValues(alpha: .15),
                height: 1,
                thickness: 1,
              ),
          ],
        ),
      ),
    );
  }
}
