import 'package:flutter/material.dart';
import 'package:marketi/features/onboarding/presentation/views/widgets/custom_page.dart';
import '../../../../core/utils/assets.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController pageController;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          isLastPage = value == 2;
          setState(() {});
        },
        controller: pageController,
        children: [
          CustomPage(
            title: 'Welcome to Marketi',
            subTitle:
                'Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.',
            image: Assets.onboarding1,
            pageController: pageController,
            isLastPage: isLastPage,
          ),
          CustomPage(
            title: 'Easy to Buy',
            subTitle:
                'Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.',
            image: Assets.onboarding2,
            pageController: pageController,
            isLastPage: isLastPage,
          ),
          CustomPage(
            title: 'Wonderful User Experience',
            subTitle:
                'Start exploring now and experience the convenience of online shopping at its best.',
            image: Assets.onboarding3,
            pageController: pageController,
            isLastPage: isLastPage,
          ),
        ],
      ),
    );
  }
}
