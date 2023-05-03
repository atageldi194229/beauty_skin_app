import 'package:beauty_skin/presentations/widgets/cards/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/widgets/cards/product_card.dart';
import 'package:flutter/rendering.dart';

class ProductListRowView extends StatelessWidget {
  const ProductListRowView({
    super.key,
    this.products = 0,
    this.onBottom,
  });

  final int products;
  final VoidCallback? onBottom;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double cardWidth = 150;
    double cardHeight = cardWidth * 1.3;

    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding * 2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products,
        itemBuilder: (context, index) {
          return Container(
              width: cardWidth,
              height: cardHeight,
              padding: EdgeInsets.only(right: kdefaultPadding),
              child: ProductCard2());
        },
      ),
    );
  }
}
