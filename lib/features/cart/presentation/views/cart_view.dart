import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/styles.dart';
import 'widgets/cart_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  'Products on Cart',
                  style: Styles.enSemiBold20().copyWith(
                    color: AppColors.darkBlue900,
                  ),
                ),
              ],
            ),
          ),
          const CartList(),
          SliverToBoxAdapter(child: const SizedBox(height: 14)),
        ],
      ),
    );
  }
}
