import 'package:beauty_skin/configs/application.dart';
import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/screens/home/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beauty_skin/constants/constants.dart';

import './widgets/banners_view.dart';
import './widgets/categories_view.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadHome()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            Application.title,
          ),
          actions: [
            IconButton(
              onPressed: () {
                AppRouter()
                    .navigatorKey
                    .currentState
                    ?.pushNamed(AppRouter.SEARCH);
              },
              icon: const Icon(
                Icons.search_outlined,
                // color: Colors.black,
              ),
            ),
            const SizedBox(width: kdefaultPadding),
          ],
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<HomeBloc>(context).add(RefreshHome());
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, homeState) {
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
                      ProductListView(
                        products: homeResponse.popularProducts,
                      ),
                      const SizedBox(height: kdefaultPadding * 2),

                      ///
                      /// Discount products
                      ///
                      ProductListView(
                        products: homeResponse.discountProducts,
                      ),
                      const SizedBox(height: kdefaultPadding * 2),

                      ///
                      /// Discount products
                      ///
                      ProductListView(
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

                return Center(child: Text("something_went_wrong".tr(context)));
              },
            ),
          ),
        ),
      ),
    );
  }
}
