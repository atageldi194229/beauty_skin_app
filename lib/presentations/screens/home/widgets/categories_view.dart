import 'package:beauty_skin/data/models/category_model.dart';
import 'package:beauty_skin/data/repositories/category_repo.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/utils/translate.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
        future: CategoryRepository().fetchCategories2(),
        builder: (context, snapshot) {
          List<CategoryModel> categories = [
            const CategoryModel(id: 0, name: "All", imagePath: "null")
          ];

          if (snapshot.data != null) {
            categories.addAll(snapshot.data!);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kdefaultPadding * 2),
                child: Text(
                  Translate.of(context).translate("category"),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ),
              const SizedBox(height: kdefaultPadding * 2),
              SizedBox(
                height: 38,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, int index) => buildItem(
                    category: categories[index],
                    isFirst: index == 0,
                    isLast: index == categories.length - 1,
                    isActive: index == currentIndex,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget buildItem({
    required CategoryModel category,
    required bool isFirst,
    required bool isLast,
    required bool isActive,
  }) {
    var cardMargin = const EdgeInsets.only(
      right: kdefaultPadding * 2,
    );
    Color cardColor = COLOR_CONST.primaryColor;
    Color? cardTextColor = Colors.black;

    if (isFirst) {
      cardMargin = cardMargin.copyWith(left: kdefaultPadding * 2);
    }

    if (isLast) {
      cardMargin = cardMargin.copyWith(right: kdefaultPadding * 2);
    }

    if (!isActive) {
      cardColor = Colors.white;
      cardTextColor = null;
    }

    return Container(
      margin: cardMargin,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius10,
        color: cardColor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kdefaultPadding * 2,
          ),
          child: Text(
            category.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: cardTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
