import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/styles.dart';
import 'home_view.dart';
import 'widgets/home_app_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];

  final List<PreferredSizeWidget> appBars = [
    const HomeAppBar(),
    const HomeAppBar(),
    const HomeAppBar(),
    const HomeAppBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars[currentIndex],
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xffB2CCFF).withValues(alpha: .5),
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.lightBlue100,
            unselectedItemColor: AppColors.grayScale,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            iconSize: 24,
            selectedLabelStyle: Styles.enMedium12().copyWith(
              color: AppColors.lightBlue100,
            ),
            unselectedLabelStyle: Styles.enMedium12().copyWith(
              color: AppColors.grayScale,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
