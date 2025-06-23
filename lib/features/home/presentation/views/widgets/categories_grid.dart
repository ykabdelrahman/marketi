import 'package:flutter/material.dart';
import '../../../data/models/category_mode.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.categories});
  final List<CategoryModel> categories;

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
            (context, index) => CategoryItem(category: categories[index]),
      ),
    );
  }
}
