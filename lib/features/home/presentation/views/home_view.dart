import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/home_product_item.dart';
import 'widgets/home_section.dart';

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
          SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(right: 14),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const HomeProductItem();
              },
            ),
          ),
          const SizedBox(height: 14),
          const HomeSection(sectionText: 'Category', clickableText: 'View all'),
        ],
      ),
    );
  }
}
