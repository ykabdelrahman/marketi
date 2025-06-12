import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_text.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.sectionText,
    required this.clickableText,
    this.onTap,
  });
  final String sectionText;
  final String clickableText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionText,
            style: Styles.enSemiBold20().copyWith(color: AppColors.darkBlue900),
          ),
          CustomText(
            onTap: onTap,
            text: clickableText,
            textStyle: Styles.enMedium16().copyWith(
              color: AppColors.lightBlue100,
            ),
          ),
        ],
      ),
    );
  }
}
