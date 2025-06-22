import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
          childAspectRatio: .9,
        ),
        itemCount: 6,
        itemBuilder:
            (context, index) =>
                const CategoryItem(image: Assets.onboarding1, title: 'Food'),
      ),
    );
  }
}
