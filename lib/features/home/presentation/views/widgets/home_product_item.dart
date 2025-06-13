import 'package:flutter/material.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({super.key});

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
                      child: Image.asset(
                        Assets.onboarding2,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 4,
                    right: 4,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(Icons.favorite_outline, size: 16),
                    ),
                  ),
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
                      '799 LE',
                      style: Styles.enMedium12().copyWith(
                        color: AppColors.darkBlue900,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_outline, size: 18),
                        const SizedBox(width: 2),
                        Text(
                          '4.5',
                          style: Styles.enMedium12().copyWith(
                            color: AppColors.darkBlue900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Black JBL Airbods',
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
                    onPressed: () {},
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
