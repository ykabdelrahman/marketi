import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/product_model.dart';
import '../../view_model/products/products_cubit.dart';
import 'home_product_item.dart';
import 'products_list.dart';

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
                child: GestureDetector(
                  onTap: () => context.read<ProductsCubit>().getProducts(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.replay_outlined), Text('Retry')],
                  ),
                ),
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
