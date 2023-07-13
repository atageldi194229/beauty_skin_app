import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/presentations/screens/search/product_filter.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/localization/translate.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding * 2),
          child: Text(
            "categories".tr(context),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        SizedBox(
          height: 38 + kDefaultPadding,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (_, int index) => buildItem(
              category: widget.categories[index],
              isFirst: index == 0,
              isLast: index == widget.categories.length - 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItem({
    required CategoryModel category,
    required bool isFirst,
    required bool isLast,
  }) {
    var cardMargin = const EdgeInsets.only(
      right: kDefaultPadding * 2,
      top: kDefaultPadding,
      bottom: kDefaultPadding,
    );

    if (isFirst) {
      cardMargin = cardMargin.copyWith(left: kDefaultPadding * 2);
    }

    if (isLast) {
      cardMargin = cardMargin.copyWith(right: kDefaultPadding * 2);
    }

    return Container(
      margin: cardMargin,
      child: InkWell(
        borderRadius: kBorderRadius5,
        onTap: () {
          AppRouter().navigatorKey.currentState?.pushNamed(
                AppRouter.SEARCH,
                arguments: ProductFilter(category: category),
              );
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius5,
            color: Colors.white,
            boxShadow: kElevationToShadow[1],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 2,
              ),
              child: Text(
                category.nameTranslate(context),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
