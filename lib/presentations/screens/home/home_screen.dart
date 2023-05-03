import 'package:beauty_skin/presentations/screens/home/widgets/product_list_row_view.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/widgets/others/my_app_bar.dart';
import 'package:beauty_skin/presentations/widgets/others/my_drawer.dart';
import 'package:beauty_skin/presentations/widgets/products_view.dart';

import './widgets/banners_view.dart';
import './widgets/categories_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
    // await BannerService().getBanners();
    // await CategoryService().getCategories();
    // homeController.getAllProducts();
    // homeController.userMoney();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: COLOR_CONST.backgroundColor,
      resizeToAvoidBottomInset: false,
      // appBar: MyAppBar(
      //   scaffoldKey,
      //   title: const Text(
      //     "Beauty Skin",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      appBar: EasySearchBar(
        title: const Text('Beauty Skin'),
        onSearch: (value) => {}, // setState(() => searchValue = value
        backgroundColor: COLOR_CONST.backgroundColor,
      ),

      body: SmartRefresher(
        controller: refreshController,
        onRefresh: _onRefresh,
        enablePullDown: true,
        enablePullUp: false,
        physics: const BouncingScrollPhysics(),
        header: const MaterialClassicHeader(
          color: COLOR_CONST.primaryColor,
        ),
        child: ListView(
          children: const [
            // BannersView(),
            SizedBox(height: kdefaultPadding * 2),
            CategoriesView(),
            SizedBox(height: kdefaultPadding * 2),
            // ProductsView(products: 20),
            ProductListRowView(products: 10),
            SizedBox(height: kdefaultPadding * 2),
            ProductListRowView(products: 10),
            SizedBox(height: kdefaultPadding * 2),
            ProductListRowView(products: 10),
            SizedBox(height: kdefaultPadding * 5),
          ],
        ),
      ),
    );
  }
}
