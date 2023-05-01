import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/utils/translate.dart';

const List<String> categories = [
  "1Hemmesi",
  "2Banner",
  "3Orakl",
  "4Foreks",
  "5Hemmesi",
  "6Banner",
  "7Orakl",
  "8Foreks",
  "9Hemmesi",
  "0Banner",
  "-Orakl",
  "wqForeks",
  "eHemmesi",
  "rBanner",
  "tOrakl",
  "yForeks",
  "uHemmesi",
  "vBanner",
  "Orakl",
  "Foreks"
];

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

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
            itemBuilder: (_, int index) {
              var cardMargin = const EdgeInsets.only(
                right: kdefaultPadding * 2,
              );
              Color cardColor = COLOR_CONST.primaryColor;
              Color? cardTextColor = Colors.black;

              if (index == 0) {
                cardMargin = cardMargin.copyWith(left: kdefaultPadding * 2);
              }

              if (index == categories.length - 1) {
                cardMargin = cardMargin.copyWith(right: kdefaultPadding * 2);
              }

              if (index != currentIndex) {
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
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: cardTextColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
