import 'package:beauty_skin/constants/color_constant.dart';
import 'package:beauty_skin/presentations/screens/cart/cart_screen.dart';
import 'package:beauty_skin/presentations/screens/favorites/favorites_screen.dart';
import 'package:beauty_skin/presentations/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      const CartScreen(),
      const FavoritesScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.home),
        title: "Home",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.bag2),
        title: "Cart",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBold.heart),
        title: "Favorites",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // return PersistentTabView.custom(
    //   context,
    //   controller: _controller,
    //   screens: _buildScreens(),
    //   resizeToAvoidBottomInset: true,
    //   itemCount: 3,
    //   screenTransitionAnimation: const ScreenTransitionAnimation(
    //     animateTabTransition: true,
    //   ),
    //   customWidget: CustomNavBarWidget(
    //     items: _navBarsItems(),
    //     selectedIndex: _controller!.index,
    //     onItemSelected: (index) {
    //       setState(() {
    //         _controller!.index = index;
    //       });
    //     },
    //   ),
    // );
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

// class CustomNavBarWidget extends StatelessWidget {
//   final int? selectedIndex;
//   final List<PersistentBottomNavBarItem>? items;
//   final ValueChanged<int>? onItemSelected;

//   const CustomNavBarWidget({
//     super.key,
//     this.selectedIndex,
//     this.items,
//     this.onItemSelected,
//   });

//   Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
//     return Tooltip(
//       message: "${item.title}",
//       textStyle: const TextStyle(
//           fontFamily: "Montserrat_Regular", color: Colors.white),
//       child: Container(
//         alignment: Alignment.center,
//         height: 50.0,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Flexible(
//               child: IconTheme(
//                 data: IconThemeData(
//                   size: 24.0,
//                   color: isSelected
//                       ? (item.activeColorSecondary ?? item.activeColorPrimary)
//                       : item.inactiveColorPrimary ?? item.activeColorPrimary,
//                 ),
//                 child: isSelected
//                     ? item.icon
//                     : item.inactiveIcon ?? const SizedBox.shrink(),
//               ),
//             ),
//             Text(
//               "${item.title}",
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: isSelected ? COLOR_CONST.primaryColor : Colors.grey,
//                 fontSize: isSelected ? 12 : 11,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 20,
//       color: Colors.white,
//       child: Container(
//         color: Colors.transparent,
//         width: double.infinity,
//         height: 50.0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: items!.map((item) {
//             final int index = items!.indexOf(item);
//             return Flexible(
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                     foregroundColor: COLOR_CONST.primaryColor.withOpacity(0.4),
//                     padding: EdgeInsets.zero,
//                     side: BorderSide.none),
//                 onPressed: () {
//                   onItemSelected!(index);
//                 },
//                 child: _buildItem(item, selectedIndex == index),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
