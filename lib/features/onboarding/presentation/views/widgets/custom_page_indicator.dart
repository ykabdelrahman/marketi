import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/themes/app_colors.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          color: AppColors.darkBlue900,
          width: 20,
          height: 20,
          borderRadius: BorderRadius.circular(10),
        ),
        dotDecoration: DotDecoration(
          color: AppColors.lightBlue700,
          width: 16,
          height: 16,
          borderRadius: BorderRadius.circular(8),
        ),
        spacing: 8,
      ),
      onDotClicked:
          (index) => pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
    );
  }
}
