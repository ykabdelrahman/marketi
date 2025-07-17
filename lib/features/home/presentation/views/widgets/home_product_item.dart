import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../cart/presentation/view_model/cart/cart_cubit.dart';
import '../../../../fav/presentation/view_model/fav/fav_cubit.dart';
import '../../../data/models/product_model.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB2CCFF).withValues(alpha: 0.7),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.lightBlue900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox.expand(
                        child: CachedNetworkImage(
                          imageUrl: product.images.first,
                          fit: BoxFit.contain,
                          errorWidget: (context, url, error) {
                            return Icon(Icons.error_outline, size: 36);
                          },
                        ),
                      ),
                    ),
                  ),
                  FavButton(product: product),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price} LE',
                      style: Styles.enMedium12().copyWith(
                        color: AppColors.darkBlue900,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_outline, size: 18),
                        const SizedBox(width: 2),
                        Text(
                          product.rating.toString().substring(0, 3),
                          style: Styles.enMedium12().copyWith(
                            color: AppColors.darkBlue900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.enMedium12().copyWith(
                    color: AppColors.darkBlue900,
                  ),
                ),
                const SizedBox(height: 4),
                // Add Button
                Align(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<CartCubit>().addCart(product);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.lightBlue100),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: const Size(120, 30),
                    ),
                    child: Text(
                      'Add',
                      style: Styles.enMedium14().copyWith(
                        color: AppColors.lightBlue100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isFav = context.watch<FavCubit>().isFavorite(product.id);
    return Positioned(
      top: 4,
      right: 4,
      child: InkWell(
        onTap: () {
          if (isFav) {
            return;
          } else {
            context.read<FavCubit>().addFav(product);
          }
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 12,
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            size: 16,
            color: isFav ? AppColors.darkBlue100 : null,
          ),
        ),
      ),
    );
  }
}
