import 'package:beauty_skin/configs/application.dart';
import 'package:beauty_skin/presentations/screens/home/widgets/product_list_row_view.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:beauty_skin/constants/constants.dart';

import './widgets/banners_view.dart';
import './widgets/categories_view.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHome()),
      child: Builder(builder: (context) {
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
            title: Text(Application.title),
            onSearch: (value) => {}, // setState(() => searchValue = value
            backgroundColor: COLOR_CONST.backgroundColor,
          ),

          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () {
              BlocProvider.of<HomeBloc>(context).add(RefreshHome());
            },
            enablePullDown: true,
            enablePullUp: false,
            physics: const BouncingScrollPhysics(),
            header: const MaterialClassicHeader(
              color: COLOR_CONST.primaryColor,
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, homeState) {
                if (homeState is HomeLoaded) {
                  var homeResponse = homeState.homeResponse;
                  return ListView(
                    children: [
                      ///
                      /// Banners
                      ///
                      BannerListView(banners: homeResponse.banners),
                      const SizedBox(height: kdefaultPadding * 2),

                      ///
                      /// Categories
                      ///
                      CategoriesView(categories: homeResponse.categories),
                      const SizedBox(height: kdefaultPadding * 2),
                      // ProductsView(products: 20),

                      ///
                      /// Popular products
                      ///
                      ProductListRowView(
                        products: homeResponse.popularProducts,
                      ),
                      const SizedBox(height: kdefaultPadding * 2),

                      ///
                      /// Discount products
                      ///
                      ProductListRowView(
                        products: homeResponse.discountProducts,
                      ),
                      const SizedBox(height: kdefaultPadding * 2),

                      ///
                      /// Discount products
                      ///
                      ProductListRowView(
                        products: homeResponse.discountProducts,
                      ),
                      const SizedBox(height: kdefaultPadding * 5),
                    ],
                  );
                }

                if (homeState is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (homeState is HomeLoadFailure) {
                  return Center(child: Text(homeState.error));
                }

                return const Center(child: Text("Something went wrong."));
              },
            ),
          ),
        );
      }),
    );
  }
}
