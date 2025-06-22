import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
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

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return ProductsList(products: state.products);
          } else if (state is ProductsError) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: Text('Retry'),
              ),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 14, right: 14),
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,
                  child: HomeProductItem(product: dummyProduct()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
