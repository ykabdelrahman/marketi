import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/brands_grid.dart';
import 'widgets/categories_grid.dart';
import 'widgets/home_section.dart';
import 'widgets/products_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          sliver: SliverToBoxAdapter(
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
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        SliverToBoxAdapter(child: Image.asset(Assets.offer)),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        const SliverToBoxAdapter(
          child: HomeSection(
            sectionText: 'Popular Product',
            clickableText: 'View all',
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        const ProductsBlocBuilder(),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        const SliverToBoxAdapter(
          child: HomeSection(
            sectionText: 'Category',
            clickableText: 'View all',
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        const CategoriesGrid(),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        const SliverToBoxAdapter(
          child: HomeSection(
            sectionText: 'Best for You',
            clickableText: 'View all',
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        const ProductsBlocBuilder(),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        const SliverToBoxAdapter(
          child: HomeSection(sectionText: 'Brands', clickableText: 'View all'),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        const BrandsGrid(),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
      ],
    );
  }
}
