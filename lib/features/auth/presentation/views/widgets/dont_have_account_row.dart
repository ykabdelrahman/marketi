import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_text.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({super.key, this.onTapSignUp});
  final void Function()? onTapSignUp;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Are you new in Marketi',
          style: Styles.enRegular12().copyWith(color: AppColors.navy),
        ),
        CustomText(
          text: ' register?',
          onTap: onTapSignUp,
          textStyle: Styles.enRegular12().copyWith(
            color: AppColors.lightBlue100,
          ),
        ),
      ],
    );
  }
}
