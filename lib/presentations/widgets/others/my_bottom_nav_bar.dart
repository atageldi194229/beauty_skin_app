import 'package:badges/badges.dart';
import 'package:beauty_skin/constants/color_constant.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/screens/cart/cart_screen.dart';
import 'package:beauty_skin/presentations/screens/categories/categories_screen.dart';
import 'package:beauty_skin/presentations/screens/favorites/favorites_screen.dart';
import 'package:beauty_skin/presentations/screens/home/home_screen.dart';
import 'package:beauty_skin/presentations/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  PersistentTabController? _controller;

  final _activeColor = COLOR_CONST.primaryColor;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.home),
        title: "home".tr(context),
        activeColorPrimary: _activeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.category),
        title: "categories".tr(context),
        activeColorPrimary: _activeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.bag2),
        inactiveIcon: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            const icon = Icon(IconlyBold.bag2);

            if (state is CartLoaded && state.cart.isNotEmpty) {
              return Badge(
                badgeContent: Text(
                  state.cart.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    // fontFamily: montserratMedium,
                  ),
                ),
                badgeAnimation: const BadgeAnimation.fade(),
                child: icon,
              );
            }

            return icon;
          },
        ),
        title: "cart".tr(context),
        activeColorPrimary: _activeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.heart),
        title: "favorites".tr(context),
        activeColorPrimary: _activeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.profile),
        title: "profile".tr(context),
        activeColorPrimary: _activeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
