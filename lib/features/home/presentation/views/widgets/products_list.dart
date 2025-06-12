import 'package:flutter/material.dart';
import 'home_product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 14),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const HomeProductItem();
        },
      ),
    );
  }
}
