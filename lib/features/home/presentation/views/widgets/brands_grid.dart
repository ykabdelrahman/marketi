import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/views/widgets/brands_item.dart';
import '../../../../../core/utils/assets.dart';

class BrandsGrid extends StatelessWidget {
  const BrandsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 14,
          childAspectRatio: 1.1,
        ),
        itemCount: 3,
        itemBuilder:
            (context, index) => const BrandsItem(image: Assets.onboarding3),
      ),
    );
  }
}
