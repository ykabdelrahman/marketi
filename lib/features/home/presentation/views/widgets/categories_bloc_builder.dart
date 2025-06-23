import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/category_mode.dart';
import '../../view_model/categories/categories_cubit.dart';
import 'categories_grid.dart';
import 'category_item.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return CategoriesGrid(categories: state.categories);
        } else if (state is CategoriesError) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: GestureDetector(
                  onTap: () => context.read<CategoriesCubit>().getCategories(),
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
              crossAxisSpacing: 10,
              childAspectRatio: .9,
            ),
            itemCount: 6,
            itemBuilder:
                (context, index) => Skeletonizer(
                  enabled: true,
                  child: CategoryItem(category: dummyCategory()),
                ),
          ),
        );
      },
    );
  }
}
