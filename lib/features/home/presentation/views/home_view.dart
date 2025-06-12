import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/brands_list.dart';
import 'widgets/categories_grid.dart';
import 'widgets/home_section.dart';
import 'widgets/products_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: const CustomTextField(
              hint: 'What are you looking for ?',
              readOnly: true,
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(
                Icons.filter_list,
                color: AppColors.lightBlue100,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Image.asset(Assets.offer),
          const SizedBox(height: 14),
          const HomeSection(
            sectionText: 'Popular Product',
            clickableText: 'View all',
          ),
          const SizedBox(height: 8),
          const ProductsList(),
          const SizedBox(height: 14),
          const HomeSection(sectionText: 'Category', clickableText: 'View all'),
          const SizedBox(height: 8),
          const CategoriesGrid(),
          const SizedBox(height: 14),
          const HomeSection(
            sectionText: 'Best for You',
            clickableText: 'View all',
          ),
          const SizedBox(height: 8),
          const ProductsList(),
          const SizedBox(height: 14),
          const HomeSection(sectionText: 'Brands', clickableText: 'View all'),
          const SizedBox(height: 8),
          const BrandsList(),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
