import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/data/cache_helper.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

void showLogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xffDBEAFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.logout, size: 40, color: AppColors.darkBlue900),
            ),
            const SizedBox(height: 20),
            Text(
              'Are you sure you want to log out?',
              style: Styles.enMedium16().copyWith(color: AppColors.darkBlue900),
            ),
            const SizedBox(height: 36),
            CustomButton(
              text: 'Log Out',
              onTap: () async {
                CacheHelper.deleteAllSecureData();
                context.go(Routes.login);
              },
            ),
          ],
        ),
      );
    },
  );
}
