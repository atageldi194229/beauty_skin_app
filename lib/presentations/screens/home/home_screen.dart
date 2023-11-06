import 'package:beauty_skin/configs/application.dart';
import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/screens/home/widgets/category_product_list_view.dart';
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
    final homeBloc = HomeBloc();

    return BlocProvider(
      create: (_) => homeBloc..add(LoadHome()),
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
            const SizedBox(width: kDefaultPadding),
          ],
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              homeBloc.add(RefreshHome());
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, homeState) {
                if (homeState is HomeLoaded) {
                  var homeResponse = homeState.homeResponse;

                  final subCategories = homeResponse.subCategories
                      .where((e) => homeResponse.subCategoryIds.contains(e.id));

                  return ListView(
                    children: [
                      ///
                      /// Banners
                      ///
                      BannerListView(banners: homeResponse.banners),
                      const SizedBox(height: kDefaultPadding * 2),

                      ///
                      /// Categories
                      ///
                      CategoriesView(categories: homeResponse.categories),
                      const SizedBox(height: kDefaultPadding * 2),
                      // ProductsView(products: 20),

                      ...subCategories.map<Widget>((subCategory) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoryProductListView(subCategory: subCategory),
                            const SizedBox(height: kDefaultPadding * 2),
                          ],
                        );
                      }),

                      const SizedBox(height: kDefaultPadding * 5),
                    ],
                  );
                }

                if (homeState is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (homeState is HomeLoadFailure) {
                  return _buildCenterText(homeState.error);
                }

                return _buildCenterText("something_went_wrong".tr(context));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCenterText(String text) {
    return ListView(children: [Center(child: Text(text))]);
  }
}
