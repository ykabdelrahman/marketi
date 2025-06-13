import 'package:flutter/material.dart';
import 'product_cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const ProductCartItem(),
    );
  }
}
