import 'package:beauty_skin/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  // A list of categories and sub-categories
  final List<Map<String, dynamic>> categories = [
    {
      "name": "Food",
      "subCategories": ["Pizza", "Burger", "Salad"]
    },
    {
      "name": "Electronics",
      "subCategories": ["Laptop", "Smartphone", "Tablet"]
    },
    {
      "name": "Books",
      "subCategories": ["Fiction", "Non-fiction", "Biography"]
    }
  ];

// A list of booleans to track the expansion state of each category
  List<bool> isExpanded = [false, false, false];

// A function to build a list of sub-categories for a given category
  List<Widget> buildSubCategories(List<String> subCategories) {
    List<Widget> list = [];
    for (String subCategory in subCategories) {
      list.add(
        ListTile(
          style: ListTileStyle.drawer,
          title: Text(subCategory),
          leading: const VerticalDivider(
            width: 2,
            color: COLOR_CONST.primaryColor,
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      expandedHeaderPadding: EdgeInsets.zero,
      elevation: 0,
      dividerColor: Colors.transparent,
      children: categories.map<ExpansionPanelRadio>((category) {
        return ExpansionPanelRadio(
          // backgroundColor: Colors.transparent,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              style: ListTileStyle.drawer,
              title: Text(category["name"]),
            );
          },
          body: Column(
            children: buildSubCategories(
              category["subCategories"],
            ),
          ),
          value: category["name"],
        );
      }).toList(),
    );
  }
}
