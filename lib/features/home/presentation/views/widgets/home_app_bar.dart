import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.lightBlue100, width: 2),
          ),
          child: Icon(Icons.person),
        ),
      ),
      title: Text(
        'Hi User !',
        style: Styles.enMedium20().copyWith(color: AppColors.darkBlue900),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.notification),
          ),
        ),
      ],
    );
  }
}
