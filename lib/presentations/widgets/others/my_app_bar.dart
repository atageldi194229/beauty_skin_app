import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;
import 'package:beauty_skin/constants/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
    this.scaffoldKey, {
    super.key,
    this.title = const Text('title'),
    this.cartSize = '3',
  });

  final Widget title;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? cartSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: COLOR_CONST.backgroundColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      title: title,
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.menu,
      //     color: Colors.black,
      //   ),
      //   onPressed: () {
      //     scaffoldKey.currentState?.openDrawer();
      //   },
      // ),
      actions: [
        IconButton(
          icon: cartSize != null
              ? badges.Badge(
                  badgeStyle: const badges.BadgeStyle(
                    padding: EdgeInsets.all(6),
                  ),
                  badgeAnimation: const badges.BadgeAnimation.fade(),
                  badgeContent: Text(
                    cartSize!,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                )
              : const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
          onPressed: () {
            // on pressed shop cart app bar action button
          },
        ),
        const SizedBox(width: kdefaultPadding * 2)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
