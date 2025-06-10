import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

void loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => const Center(
          child: CircularProgressIndicator(color: AppColors.lightBlue500),
        ),
  );
}
