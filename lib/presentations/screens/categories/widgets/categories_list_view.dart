import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/screens/search/product_filter.dart';
import 'package:beauty_skin/presentations/widgets/others/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/categories_bloc.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  /// A function to build a list of sub-categories for a given category
  List<Widget> _buildSubCategories(
    BuildContext context,
    CategoryModel category,
    List<SubCategoryModel> subCategories,
  ) {
    List<Widget> list = [];
    for (var subCategory in subCategories) {
      list.add(
        ListTile(
          onTap: () => _navigateToProducts(category, subCategory),
          style: ListTileStyle.drawer,
          title: Text(subCategory.nameTranslate(context)),
          leading: SizedBox.square(
            dimension: 25,
            child: CachedNetworkImage(
              imageUrl: subCategory.imagePath,
              fit: BoxFit.fill,
            ),
          ),
          // leading: const VerticalDivider(
          //   width: 2,
          //   color: COLOR_CONST.primaryColor,
          // ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Loading();
        }

        if (state is CategoriesLoaded) {
          final categories = state.categoriesResponse.categories;
          final subCategories = state.categoriesResponse.subCategories;

          return ExpansionPanelList.radio(
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            dividerColor: Colors.transparent,
            children: categories.map<ExpansionPanelRadio>((category) {
              return ExpansionPanelRadio(
                // backgroundColor: Colors.transparent,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    onTap: () => _navigateToProducts(category, null),
                    style: ListTileStyle.drawer,
                    title: Text(category.nameTranslate(context)),
                  );
                },
                body: Column(
                  children: _buildSubCategories(
                    context,
                    category,
                    subCategories.where((e) => e.catId == category.id).toList(),
                  ),
                ),
                value: category.id,
              );
            }).toList(),
          );
        }

        if (state is CategoriesLoadFailure) {
          return Center(child: Text(state.error));
        }

        return Center(child: Text('something_went_wrong'.tr(context)));
      },
    );
  }

  _navigateToProducts(CategoryModel? category, SubCategoryModel? subCategory) {
    AppRouter().navigatorKey.currentState?.pushNamed(
          AppRouter.SEARCH,
          arguments: ProductFilter(
            category: category,
            subCategory: subCategory,
          ),
        );
  }
}
