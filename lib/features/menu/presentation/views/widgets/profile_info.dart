import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 101,
          width: 99,
          child: Stack(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Assets.onboarding1),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.notification,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'User Name',
          style: Styles.enSemiBold18().copyWith(color: AppColors.darkBlue900),
        ),
        Text(
          'user@gmail.com',
          style: Styles.enMedium14().copyWith(color: AppColors.grayScale),
        ),
      ],
    );
  }
}
