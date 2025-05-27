import 'package:flutter/material.dart';
import 'package:marketi/core/themes/styles.dart';
import 'package:marketi/features/auth/presentation/views/widgets/social_row.dart';
import '../../../../../core/themes/app_colors.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Or Continue With',
          style: Styles.enRegular12().copyWith(color: AppColors.navy),
        ),
        const SizedBox(height: 16),
        const SocialRow(),
      ],
    );
  }
}
