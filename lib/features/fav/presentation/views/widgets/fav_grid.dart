import 'package:flutter/material.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import '../../../../home/presentation/views/widgets/home_product_item.dart';

class FavGrid extends StatelessWidget {
  const FavGrid({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: .84,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) => HomeProductItem(product: products[index]),
    );
  }
}
