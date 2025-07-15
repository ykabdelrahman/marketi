import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../home/data/models/product_model.dart';
import '../../../../home/presentation/views/widgets/home_product_item.dart';
import '../../view_model/fav/fav_cubit.dart';
import 'fav_grid.dart';

class FavBlocBuilder extends StatelessWidget {
  const FavBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavError) {
          return Center(child: Text(state.message));
        } else if (state is FavLoaded) {
          return FavGrid(products: state.products);
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: .84,
          ),
          itemCount: 10,
          itemBuilder:
              (_, index) => Skeletonizer(
                enabled: true,
                child: HomeProductItem(product: dummyProduct()),
              ),
        );
      },
    );
  }
}
