import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../data/models/brand_model.dart';

class BrandsItem extends StatelessWidget {
  const BrandsItem({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.rect),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: SizedBox.expand(
        child: CachedNetworkImage(
          imageUrl: brand.imagePath,
          fit: BoxFit.contain,
          errorWidget: (context, url, error) {
            return Icon(Icons.error_outline, size: 36);
          },
        ),
      ),
    );
  }
}
