import 'package:beauty_skin/presentations/widgets/cards/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/widgets/cards/product_card.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    super.key,
    this.products = 0,
    this.onBottom,
  });

  final int products;
  final VoidCallback? onBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding * 2),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 0.7,
          crossAxisSpacing: kdefaultPadding * 2,
          mainAxisSpacing: kdefaultPadding * 2,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products,
        itemBuilder: (context, index) {
          // return const ProductCard2(
          //   product: products[index],
          //   imageUrl:
          //       "https://sharafyabi.com/uploads/115/16022022-071957_383-big.webp",
          // );
          return Container();
        },
      ),
    );
  }
}
