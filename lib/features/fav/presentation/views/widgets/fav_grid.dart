import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widgets/home_product_item.dart';

class FavGrid extends StatelessWidget {
  const FavGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: .84,
      ),
      itemCount: 10,
      itemBuilder: (_, index) => HomeProductItem(),
    );
  }
}
