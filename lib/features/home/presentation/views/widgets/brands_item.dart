import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';

class BrandsItem extends StatelessWidget {
  const BrandsItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.rect),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}
