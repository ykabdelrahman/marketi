import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../data/models/cart_model.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key, required this.product});
  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.rect),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xffB2CCFF).withValues(alpha: .5),
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: product.images.first,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Icon(Icons.error_outline, size: 36);
            },
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.enMedium14().copyWith(
                          color: AppColors.darkBlue900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.favorite_border, size: 20),
                  ],
                ),
                const SizedBox(height: 4),

                Text(
                  product.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.enMedium14().copyWith(
                    color: AppColors.grayScale,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Price: ${product.price} EGP',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.enMedium14().copyWith(
                          color: AppColors.darkBlue900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(Icons.star_outline, size: 18),
                        SizedBox(width: 4),
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
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue900,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.delete, color: AppColors.darkRed200),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Color(0xffF5FBFF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: Styles.enSemiBold14().copyWith(
                              color: AppColors.lightBlue100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue900,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.add, color: AppColors.lightBlue100),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
