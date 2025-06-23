import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import 'home_product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 14, right: 14),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 14),
            child: HomeProductItem(product: products[index]),
          );
        },
      ),
    );
  }
}
