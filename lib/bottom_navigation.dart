import 'package:badges/badges.dart';
import 'package:beauty_skin/constants/color_constant.dart';
import 'package:beauty_skin/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  int selectedPageIndex = 0;

  TabController? tabController;
  PersistentTabController? _controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    tabController = TabController(vsync: this, length: 5);
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens() {
    return [
      // HomePage(),
      // CategoryPage(),
      // CartPage(), //
      // const TabbarViewPage(), //
      // UserProfil()
    ];
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.custom(
      context,
      controller: _controller,
      screens: _buildScreens(),
      resizeToAvoidBottomInset: true,
      itemCount: 5,
      screenTransitionAnimation:
          const ScreenTransitionAnimation(animateTabTransition: true),
      customWidget: CustomNavBarWidget(
        items: [
          PersistentBottomNavBarItem(
            activeColorPrimary: COLOR_CONST.primaryColor,
            inactiveColorPrimary: Colors.grey,
            inactiveIcon: const Icon(IconlyLight.home),
            icon: const Icon(IconlyBold.home),
            title: Translate.of(context).translate('homePage'),
          ),
          PersistentBottomNavBarItem(
            activeColorPrimary: COLOR_CONST.primaryColor,
            inactiveColorPrimary: Colors.grey,
            inactiveIcon: const Icon(IconlyLight.category),
            icon: const Icon(IconlyBold.category),
            title: Translate.of(context).translate('category'),
          ),
          PersistentBottomNavBarItem(
            inactiveIcon: false // cart list empty
                ? const Icon(CupertinoIcons.cart)
                : const Badge(
                    badgeContent: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        // fontFamily: montserratMedium,
                      ),
                    ),
                    badgeAnimation: BadgeAnimation.fade(),
                    child: Icon(CupertinoIcons.cart)),
            icon: false // cart is empty
                ? const Icon(CupertinoIcons.cart_fill)
                : const Badge(
                    badgeContent: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        // fontFamily: montserratMedium,
                      ),
                    ),
                    badgeAnimation: BadgeAnimation.fade(),
                    child: Icon(CupertinoIcons.cart_fill),
                  ),
            title: Translate.of(context).translate('cart'),
            // title: Get.find<Fav_Cart_Controller>().cartList.isEmpty
            //     ? 'cart'.tr
            //     : "${Get.find<Fav_Cart_Controller>().priceAll.value.toStringAsFixed(2)} m.",
            activeColorPrimary: COLOR_CONST.primaryColor,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            activeColorPrimary: COLOR_CONST.primaryColor,
            inactiveColorPrimary: Colors.grey,
            inactiveIcon: const Icon(IconlyLight.paper),
            icon: const Icon(IconlyBold.paper),
            title: Translate.of(context).translate('news'),
          ),
          PersistentBottomNavBarItem(
            activeColorPrimary: COLOR_CONST.primaryColor,
            inactiveColorPrimary: Colors.grey,
            inactiveIcon: const Icon(IconlyLight.profile),
            icon: const Icon(IconlyBold.profile),
            title: Translate.of(context).translate('profil'),
          ),
        ],
        selectedIndex: _controller!.index,
        onItemSelected: (index) {
          setState(() {
            if (index == 2) {
              // Get.find<CartPageController>().loadData(parametrs: {
              //   "products": jsonEncode(Get.find<Fav_Cart_Controller>().cartList)
              // });
            }
            _controller!.index = index;
          });
        },
      ),
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int? selectedIndex;
  final List<PersistentBottomNavBarItem>? items;
  final ValueChanged<int>? onItemSelected;

  const CustomNavBarWidget({
    super.key,
    this.selectedIndex,
    this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Tooltip(
      message: "${item.title}",
      textStyle: const TextStyle(
          fontFamily: "Montserrat_Regular", color: Colors.white),
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: IconTheme(
                data: IconThemeData(
                    size: 24.0,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary ?? item.activeColorPrimary),
                child: isSelected
                    ? item.icon
                    : item.inactiveIcon ?? const SizedBox.shrink(),
              ),
            ),
            Text(
              "${item.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isSelected ? COLOR_CONST.primaryColor : Colors.grey,
                fontSize: isSelected ? 12 : 11,
                // fontFamily: montserratMedium,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: Colors.white,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items!.map((item) {
            final int index = items!.indexOf(item);
            return Flexible(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: COLOR_CONST.primaryColor.withOpacity(0.4),
                    side: BorderSide.none),
                onPressed: () {
                  onItemSelected!(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
