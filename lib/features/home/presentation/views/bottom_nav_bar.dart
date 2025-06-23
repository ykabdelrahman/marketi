import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/get_it.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/styles.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../cart/presentation/views/widgets/cart_bottom_sheet.dart';
import '../../../fav/presentation/views/fav_view.dart';
import '../../../menu/presentation/views/menu_view.dart';
import '../view_model/categories/categories_cubit.dart';
import '../view_model/products/products_cubit.dart';
import 'home_view.dart';
import 'widgets/home_app_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;

  final List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductsCubit>()..getProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..getCategories(),
        ),
      ],
      child: const HomeView(),
    ),
    const CartView(),
    const FavView(),
    const MenuView(),
  ];

  final List<PreferredSizeWidget> appBars = [
    const HomeAppBar(),
    AppBar(title: Text('Cart'), centerTitle: true),
    AppBar(title: Text('Favorites'), centerTitle: true),
    AppBar(title: Text('Menu'), centerTitle: true),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomSheet: currentIndex == 1 ? CartBottomSheet() : null,
      appBar: appBars[currentIndex],
      body: IndexedStack(index: currentIndex, children: screens),
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

  @override
  bool get wantKeepAlive => true;
}
