import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_button.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.rect)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suptotal (3 items)',
                style: Styles.enSemiBold14().copyWith(
                  color: AppColors.darkBlue900,
                ),
              ),
              Text(
                'EGP 1,120,00',
                style: Styles.enSemiBold14().copyWith(
                  color: AppColors.darkBlue900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          CustomButton(text: 'Checkout', onTap: () {}),
        ],
      ),
    );
  }
}
