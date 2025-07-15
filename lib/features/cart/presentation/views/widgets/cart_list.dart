import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/cart_model.dart';
import '../../view_model/cart/cart_cubit.dart';
import 'product_cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          if (state.products.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }
          return SliverList.builder(
            itemCount: state.products.length,
            itemBuilder:
                (context, index) =>
                    ProductCartItem(product: state.products[index]),
          );
        } else if (state is CartError) {
          return Center(child: Text(state.message));
        }
        return SliverList.builder(
          itemCount: 4,
          itemBuilder:
              (context, index) => Skeletonizer(
                enabled: true,
                child: ProductCartItem(product: dummyCart()),
              ),
        );
      },
    );
  }
}
