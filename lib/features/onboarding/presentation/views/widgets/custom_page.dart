import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/features/onboarding/presentation/views/widgets/custom_page_indicator.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    this.title,
    this.subTitle,
    this.image,
    this.pageController,
    this.isLastPage,
  });

  final String? title;
  final String? subTitle;
  final String? image;
  final PageController? pageController;
  final bool? isLastPage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: size.height * .07),
            Image.asset(
              image!,
              height: size.height * .4,
              width: size.height * .35,
            ),
            SizedBox(height: 20),
            CustomPageIndicator(pageController: pageController!),
            SizedBox(height: 20),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: Styles.enSemiBold20().copyWith(
                color: AppColors.darkBlue900,
              ),
            ),

            SizedBox(height: size.height * .058),
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: Styles.enMedium14().copyWith(color: AppColors.darkBlue900),
            ),
            const Spacer(),
            CustomButton(
              text: isLastPage! ? 'Get Started' : 'Next',
              onTap: () {
                isLastPage!
                    ? context.go(Routes.login)
                    : pageController!.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
