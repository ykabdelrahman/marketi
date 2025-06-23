import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../data/models/category_mode.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.rect),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: SizedBox.expand(
              child: CachedNetworkImage(
                imageUrl: category.imagePath,
                fit: BoxFit.contain,
                errorWidget: (context, url, error) {
                  log('Error loading category image: $error');
                  return Icon(Icons.error_outline, size: 36);
                },
              ),
            ),
          ),
        ),
        Text(
          category.name,
          style: Styles.enMedium16().copyWith(color: AppColors.darkBlue900),
        ),
      ],
    );
  }
}
