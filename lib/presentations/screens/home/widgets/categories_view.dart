import 'package:beauty_skin/data/models/category_model.dart';
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
          padding: const EdgeInsets.only(left: kdefaultPadding * 2),
          child: Text(
            "category".tr(context),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ),
        const SizedBox(height: kdefaultPadding),
        SizedBox(
          height: 38 + kdefaultPadding,
          child: ListView.builder(
            // padding: const EdgeInsets.symmetric(vertical: kdefaultPadding),
            // physics: const ClampingScrollPhysics(),
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

    // return FutureBuilder<List<CategoryModel>>(
    //   future: CategoryRepository().fetchCategories2(),
    //   builder: (context, snapshot) {
    //     List<CategoryModel> categories = [
    //       const CategoryModel(id: 0, name: "All", imagePath: "null")
    //     ];

    //     if (snapshot.data != null) {
    //       categories.addAll(snapshot.data!);
    //     }

    //     // return
    //   },
    // );
  }

  Widget buildItem({
    required CategoryModel category,
    required bool isFirst,
    required bool isLast,
  }) {
    var cardMargin = const EdgeInsets.only(
      right: kdefaultPadding * 2,
      top: kdefaultPadding,
      bottom: kdefaultPadding,
    );

    if (isFirst) {
      cardMargin = cardMargin.copyWith(left: kdefaultPadding * 2);
    }

    if (isLast) {
      cardMargin = cardMargin.copyWith(right: kdefaultPadding * 2);
    }

    return Container(
      margin: cardMargin,
      child: InkWell(
        borderRadius: kBorderRadius5,
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius5,
            color: Colors.white,
            boxShadow: kElevationToShadow[1],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kdefaultPadding * 2,
              ),
              child: Text(
                category.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
