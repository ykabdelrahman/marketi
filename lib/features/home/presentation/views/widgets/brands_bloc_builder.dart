import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../view_model/brands/brands_cubit.dart';
import 'brands_grid.dart';
import 'brands_item.dart';

class BrandsBlocBuilder extends StatelessWidget {
  const BrandsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsLoaded) {
          return BrandsGrid(brands: state.brands);
        } else if (state is BrandsError) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: GestureDetector(
                  onTap: () => context.read<BrandsCubit>().getBrands(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.replay_outlined), Text('Retry')],
                  ),
                ),
              ),
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 14,
              childAspectRatio: 1.1,
            ),
            itemCount: 3,
            itemBuilder:
                (context, index) => Skeletonizer(
                  enabled: true,
                  child: BrandsItem(brand: dummyBrand()),
                ),
          ),
        );
      },
    );
  }
}
