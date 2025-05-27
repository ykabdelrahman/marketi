import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/assets.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialIcon(image: Assets.googleIcon, onTap: () {}),
        const SizedBox(width: 16),
        CustomSocialIcon(image: Assets.appleIcon, onTap: () {}),
        const SizedBox(width: 16),
        CustomSocialIcon(image: Assets.fbIcon, onTap: () {}),
      ],
    );
  }
}

class CustomSocialIcon extends StatelessWidget {
  const CustomSocialIcon({super.key, this.onTap, required this.image});
  final void Function()? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(26),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.rect),
        ),
        child: SvgPicture.asset(image, fit: BoxFit.none),
      ),
    );
  }
}
