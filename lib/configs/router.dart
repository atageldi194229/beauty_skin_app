// ignore_for_file: constant_identifier_names

import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/presentations/screens/about_us/about_us_screen.dart';
import 'package:beauty_skin/presentations/screens/cart/cart_screen.dart';
import 'package:beauty_skin/presentations/screens/categories/categories_screen.dart';
import 'package:beauty_skin/presentations/screens/checkout/checkout_screen.dart';
import 'package:beauty_skin/presentations/screens/delivery_address/delivery_address_screen.dart';
import 'package:beauty_skin/presentations/screens/detail_product/detail_product_screen.dart';
import 'package:beauty_skin/presentations/screens/home/home_screen.dart';
import 'package:beauty_skin/presentations/screens/order/order_screen.dart';
import 'package:beauty_skin/presentations/screens/profile/profile_screen.dart';
import 'package:beauty_skin/presentations/screens/search/product_filter.dart';
import 'package:beauty_skin/presentations/screens/search/search_screen.dart';
import 'package:beauty_skin/presentations/screens/splash/splash_screen.dart';
import 'package:beauty_skin/presentations/widgets/others/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AppRouter {
  final navigatorKey = GlobalKey<NavigatorState>();

  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String HOME = '/home';
  static const String PROFILE = '/profile';
  static const String DETAIL_PRODUCT = '/detail_product';
  static const String CART = '/cart';
  static const String MY_ORDERS = '/my_orders';
  static const String DETAIL_ORDER = '/detail_order';
  static const String CATEGORIES = '/categories';
  static const String SEARCH = '/search';
  static const String MAIN = '/main';
  static const String ABOUT_US = '/about_us';
  static const String DELIVERY_ADDRESS = '/delivery_address';
  static const String CHECKOUT_SCREEN = '/checkout_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAIN:
        return MaterialPageRoute(
          builder: (_) => const MyBottomNavBar(),
        );

      case HOME:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case SPLASH:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case CART: // case CART:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );

      case DETAIL_PRODUCT:
        var product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => DetailProductScreen(product: product),
        );

      case SEARCH:
        ProductFilter filter = const ProductFilter();

        if (settings.arguments != null) {
          filter = settings.arguments as ProductFilter;
        }

        return MaterialPageRoute(
          builder: (_) => SearchScreen(filter: filter),
        );

      case PROFILE:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      case ABOUT_US:
        return MaterialPageRoute(
          builder: (_) => const AboutUsScreen(),
        );

      case DELIVERY_ADDRESS:
        DeliveryAddressScreenArguments? arguments;

        if (settings.arguments != null) {
          arguments = settings.arguments as DeliveryAddressScreenArguments;
        }

        return MaterialPageRoute(
          builder: (_) => DeliveryAddressScreen(arguments: arguments),
        );

      case CHECKOUT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
        );

      case CATEGORIES:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());

      case MY_ORDERS:
        return MaterialPageRoute(builder: (_) => const OrderScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  ///Singleton factory
  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal();
}
